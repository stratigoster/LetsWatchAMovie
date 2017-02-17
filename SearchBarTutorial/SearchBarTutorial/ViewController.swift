//
//  ViewController.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let blackView = UIView()
    
    @IBOutlet weak var moreButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let settingsLauncher = SettingLauncher()
    
    @IBAction func moreButtonPressed(_ sender: Any) {
        settingsLauncher.showSettings()
    }
    
    func handleMore() {
        settingsLauncher.showSettings()
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
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

