//
//  TableViewControllerPosts.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class TableViewPosts: UITableView, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Controls
    var Posts: [Post] = []
    
    func initialize() {
        self.dataSource = self
        self.delegate = self
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = "TableViewCellPosts"
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCellPosts
        let currentPost: Post = Posts[indexPath.row]
        cell.lblTitle.text = currentPost.title
        cell.lblBody.text = currentPost.body
        cell.lblUserId.text = String(currentPost.userId)
        cell.lblPostId.text = String(currentPost.id)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Posts.count
    }

    
    

}
