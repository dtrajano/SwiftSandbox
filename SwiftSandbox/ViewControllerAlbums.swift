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
    @IBOutlet weak var btnPesquisar: UIButton!
    @IBOutlet weak var txtPesquisa: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tbvAlbums.initialize()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
    //MARK: - Control Events
    @IBAction func btnPesquisar_Click(_ sender: Any) {
        Utility.customActivityIndicatory(self.view, startAnimate: true)
        let textoPesquisa = txtPesquisa.text?.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        self.tbvAlbums.Albums = []
        self.tbvAlbums.reloadData()

        _ = RepositoryAlbums.sharedInstance().getAlbums(artistName: textoPesquisa!).subscribe(
            onNext: { resultado in
                self.tbvAlbums.Albums = resultado
                self.tbvAlbums.reloadData()
                Utility.customActivityIndicatory(self.view, startAnimate: false)
        })
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
