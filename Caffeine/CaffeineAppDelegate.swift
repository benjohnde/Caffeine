//
//  AppDelegate.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

@NSApplicationMain
class CaffeineAppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate, CaffeineControllerDelegate {
    @IBOutlet weak var menu: NSMenu!
    var caffeine: CaffeineController?
    
    func applicationWillBecomeActive(notification: NSNotification) {
        caffeine = CaffeineController(delegate: self)
    }
    
    // MARK: - CaffeineControllerDelegate
    
    func popUpStatusItemMenu(statusItem: NSStatusItem) {
        statusItem.popUpStatusItemMenu(menu)
    }
}
