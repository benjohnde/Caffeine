//
//  CaffeineStatusIcon.swift
//  Caffeine
//
//  Created by Ben John on 12/04/16.
//  Copyright © 2016 Ben John. All rights reserved.
//

import Cocoa

struct StatusIcon {
    static var clean: NSImage {
        get {
            let icon = NSImage(named: "statusIconClean")!
            icon.template = true
            return icon
        }
    }
    static var injected: NSImage {
        get {
            let icon = NSImage(named: "statusIconInjected")!
            icon.template = true
            return icon
        }
    }
}
