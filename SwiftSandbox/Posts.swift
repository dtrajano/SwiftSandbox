//
//  User.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class Post: NSObject {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String

    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    init(json: Any) {
        let jsonTemp = json as! Dictionary<String, Any>
        if(!jsonTemp.isEmpty) {
            self.userId = jsonTemp["userId"] as! Int
            self.id = jsonTemp["id"] as! Int
            self.title = jsonTemp["title"] as! String
            self.body = jsonTemp["body"] as! String
        }
        else {
            self.userId = -1
            self.id = -1
            self.title = ""
            self.body = ""
        }
    }
}
