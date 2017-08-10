//
//  TableViewCellAlbums.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class TableViewCellAlbums: UITableViewCell {

    //MARK: - Controls
    @IBOutlet weak var imgAlbumPhoto: UIImageView!
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTrackCount: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgAlbumPhoto.image = #imageLiteral(resourceName: "defaultImageAlbum")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
