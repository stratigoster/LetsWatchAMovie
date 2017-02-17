//
//  SettingsLauncher.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-17.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class SettingLauncher: NSObject {
    
    let blackView = UIView()

    
    func showSettings() {
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
                
            })
        }
    }
    
    func handleDismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
           
        })
    }

    override init() {
        super.init()
    }
}
