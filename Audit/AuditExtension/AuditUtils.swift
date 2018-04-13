//
//  AuditUtils.swift
//  AuditExtension
//
//  Created by Suyash Srijan on 08/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit

class AuditUtils {
    
    struct AuditItem: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case type = "type"
            case secondType = "2nd type"
            case thirdType = "3rd type"
            case notes = "Source Notes (things to know?)"
        }
        
        let type: AuditType
        let secondType: AuditType
        let thirdType: AuditType
        let notes: String
        
        init(from decoder: Decoder) throws {
            let con = try! decoder.container(keyedBy: CodingKeys.self)
            type = try! AuditType(value: con.decode(String.self, forKey: AuditUtils.AuditItem.CodingKeys.type))
            
            secondType = try! AuditType(value: con.decode(String.self, forKey: AuditUtils.AuditItem.CodingKeys.secondType))
            
            thirdType = try! AuditType(value: con.decode(String.self, forKey: AuditUtils.AuditItem.CodingKeys.thirdType))
            
            notes = try! con.decode(String.self, forKey: AuditUtils.AuditItem.CodingKeys.notes)
        }
    }
    
    static func getAuditType(host: String, completion: @escaping (AuditType)->()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let sourcesData = NSDataAsset(name: "sources", bundle: Bundle.main)
            let json = try! JSONDecoder().decode([String: AuditItem].self, from: sourcesData!.data)
            if let auditItem = json.filter({$0.key == host}).first {
                completion(auditItem.value.type)
            } else {
                completion(AuditType.Unknown)
            }
        }
    }
    
}
