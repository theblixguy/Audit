//
//  URLExtention.swift
//  AuditExtension
//
//  Created by Suyash Srijan on 08/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

extension URL {
    var hostWithoutWww: String? {
        get {
            if let unwrappedHost = self.host, unwrappedHost.hasPrefix("www.") {
                return String(unwrappedHost.dropFirst(4))
            } else {
                return self.host
            }
        }
    }
}
