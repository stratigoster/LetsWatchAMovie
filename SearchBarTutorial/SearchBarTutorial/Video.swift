//
//  Video.swift
//  SearchBarTutorial
//
//  Created by xszhao on 2017-02-19.
//  Copyright © 2017 xszhao. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var otherImageName: String?
    var title: String?
    var content: String?
    
    var numberOfViews: NSNumber?
    var uploadDate: Date?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
