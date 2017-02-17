//
//  ViewController.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moreButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        
        if let window = UIApplication.shared.keyWindow {
            
            let blackView = UIView()
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            window.addSubview(blackView)
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                blackView.alpha = 1
            })
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

