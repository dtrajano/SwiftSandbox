//
//  TableViewAlbums.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class TableViewAlbums: UITableView, UITableViewDataSource, UITableViewDelegate {

    var Albums:[Album] = [];
    
    func initialize() {
        self.dataSource = self
        self.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "TableViewCellAlbums"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCellAlbums
        let album = Albums[indexPath.row]
        cell.lblAlbumName.text = album.collectionName
        cell.lblPrice.text = "$" + String(album.collectionPrice)
        cell.lblTrackCount.text = String(album.trackCount) + " Músicas"
        return cell
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Albums.count
    }
}
