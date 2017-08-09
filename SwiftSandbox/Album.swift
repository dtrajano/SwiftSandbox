//
//  Album.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit
import EVReflection

class Album: EVObject {
    var collectionName: String = ""
    var artworkUrl60: String = ""
    var collectionPrice: Double = 0.0
    var trackCount: Int = 0
    
    required init() {
    }
}
