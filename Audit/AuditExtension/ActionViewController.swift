//
//  ActionViewController.swift
//  AuditExtension
//
//  Created by Suyash Srijan on 08/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import UIKit
import SwiftyJSON
import MobileCoreServices

class ActionViewController: UIViewController {
    
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item : NSExtensionItem = self.extensionContext!.inputItems[0] as! NSExtensionItem
        let itemProvider : NSItemProvider = item.attachments?.first as! NSItemProvider
        if (itemProvider.hasItemConformingToTypeIdentifier(kUTTypeURL as String)) {
            itemProvider.loadItem(forTypeIdentifier: kUTTypeURL as String, options: nil, completionHandler: { (urlItem, error) in
                if let currentUrl: URL = urlItem as? URL {
                    AuditUtils.getAuditType(host: currentUrl.hostWithoutWww!, completion: { (result) in
                        DispatchQueue.main.async {
                            self.typeLabel.text = result.title()
                            self.descriptionLabel.text = result.description()
                            if result == AuditType.Unknown || result == AuditType.Political {
                                self.subtitleLabel.text = "This website may or may not be a reliable news source"
                                self.typeIcon.image = UIImage(named: "UnknownIcon")
                            } else if result == AuditType.Reliable {
                                self.subtitleLabel.text = "This website is a reliable news source"
                                self.typeIcon.image = UIImage(named: "VerifiedIcon")
                            } else {
                                self.subtitleLabel.text = "This website is not a reliable news source"
                                self.typeIcon.image = UIImage(named: "WarningIcon")
                            }
                        }
                    })
                }
            })
        }
    }
    
    @IBAction func closeApp(_ sender: Any) {
        self.extensionContext!.completeRequest(returningItems: nil, completionHandler: nil)
    }
}
