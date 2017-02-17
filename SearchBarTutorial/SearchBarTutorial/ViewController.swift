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
        let blackView = UIView()
        blackView.backgroundColor = UIColor.black
        
        view.addSubview(blackView)
        blackView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

