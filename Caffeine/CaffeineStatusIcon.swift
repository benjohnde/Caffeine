//
//  CaffeineStatusIcon.swift
//  Caffeine
//
//  Created by Ben John on 12/04/16.
//  Copyright © 2016 Ben John. All rights reserved.
//

import Cocoa

enum StatusIcon: String {
    case clean = "statusIconClean"
    case injected = "statusIconInjected"
    
    fileprivate var named: NSImage.Name {
        return NSImage.Name(rawValue: self.rawValue)
    }
    
    var image: NSImage {
        guard let image = NSImage(named: named) else {
            fatalError()
        }
        image.isTemplate = true
        return image
    }
}
