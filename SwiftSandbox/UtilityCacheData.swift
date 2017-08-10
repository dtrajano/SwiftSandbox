//
//  UtilityCacheData.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 10/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class UtilityCacheData: NSObject {
    
    static let cache = NSCache<NSString, AnyObject>()
    
    static func saveObjectOnCache(object: Any, cacheIdentifier: String) {
        cache.setObject(object as AnyObject, forKey: cacheIdentifier as NSString)
    }

    static func fetchObjectFromCache(cacheIdentifier: String) -> Any? {
        if let cachedVersion = cache.object(forKey: cacheIdentifier as NSString) {
            return cachedVersion as Any
        } else {
            return nil
        }
    }
    
    static func deleteObjectFromCache(cacheIdentifier: String) {
        cache.removeObject(forKey: cacheIdentifier as NSString)
    }
    
    static func isObjectExistsOnCache(cacheIdentifier: String) -> Bool {
        if cache.object(forKey: cacheIdentifier as NSString) != nil {
            return true
        }
        return false
    }
}
