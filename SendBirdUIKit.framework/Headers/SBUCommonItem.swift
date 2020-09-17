//
//  SBUCommonItem.swift
//  SendBirdUIKit
//
//  Created by Tez Park on 17/02/2020.
//  Copyright © 2020 SendBird, Inc. All rights reserved.
//

import UIKit

@objcMembers
public class SBUCommonItem: NSObject {
    var title: String?
    var color: UIColor?
    var image: UIImage?
    var font: UIFont?
    var textAlignment: NSTextAlignment
    
    public init(title: String? = nil,
                color: UIColor? = SBUColorSet.onlight01,
                image: UIImage? = nil,
                font: UIFont? = nil,
                textAlignment: NSTextAlignment = .left) {
        
        self.title = title
        self.color = color
        self.image = image
        self.font = font
        self.textAlignment = textAlignment
    }
}
