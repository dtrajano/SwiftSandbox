//
//  ViewControllerMusics.swift
//  SwiftSandbox
//
//  Created by Diogo Trajano on 09/08/17.
//  Copyright © 2017 Diogo Trajano. All rights reserved.
//

import UIKit

class ViewControllerAlbums: UIViewController {

    //MARK: - Controls
    @IBOutlet weak var tbvAlbums: TableViewAlbums!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvAlbums.initialize()
        _ = RepositoryAlbums.sharedInstance().getAlbums().subscribe(
            onNext: { resultado in
                self.tbvAlbums.Albums = resultado
                self.tbvAlbums.reloadData()
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
