//
//  TableViewCellPosts.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 07/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class TableViewCellPosts: UITableViewCell {

    //MARK: Controls
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblPostId: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
