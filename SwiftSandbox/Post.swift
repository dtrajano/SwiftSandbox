//
//  User.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 04/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import EVReflection

class Post: EVObject {
    
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    required init() {
    }
}
