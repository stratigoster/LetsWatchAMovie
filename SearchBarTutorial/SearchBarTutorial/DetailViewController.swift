//
//  DetailViewController.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if self.imageName != nil {
            self.portraitImageView.image = UIImage(named: imageName!)
        }
    }
    @IBOutlet weak var portraitImageView: UIImageView!
    
    var imageName: String?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender:sender)
        
        if segue.identifier == "toDetailView" {
            
        }
    }
}
