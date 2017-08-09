//
//  ViewControllerPosts.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class ViewControllerPosts: UIViewController {

    //MARK: - Controls
    @IBOutlet weak var tbvPosts: TableViewPosts!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvPosts.initialize()
        _ = RepositoryPosts.sharedInstance().getPostById(postId: 1)
            .subscribe(onNext: { posts in
                self.tbvPosts.Posts = posts
                self.tbvPosts.reloadData()
            }, onError: { error in
                print(error)
            })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
