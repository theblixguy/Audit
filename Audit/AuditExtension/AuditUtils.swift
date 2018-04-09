//
//  AuditUtils.swift
//  AuditExtension
//
//  Created by Suyash Srijan on 08/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class AuditUtils {
    
    static func getAuditType(host: String, completion: @escaping (AuditType)->()) {
        let queue: OperationQueue = OperationQueue()
        queue.addOperation {
            let sourcesData = NSDataAsset(name: "sources", bundle: Bundle.main)
            let json = try? JSON(data: sourcesData!.data)
            if let type: String = json![host]["type"].string {
                OperationQueue.main.addOperation({
                    completion(AuditType(value: type))
                })
            } else {
                OperationQueue.main.addOperation({
                    completion(AuditType.Unknown)
                })
            }
        }
    }
    
}
