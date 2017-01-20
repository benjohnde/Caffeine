//
//  AppDelegate.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

@NSApplicationMain
class CaffeineAppDelegate: NSObject, NSApplicationDelegate, CaffeineControllerDelegate {
    fileprivate let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    fileprivate var caffeine: CaffeineController?
    
    @IBOutlet weak var menu: NSMenu!
    
    // MARK: - NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        caffeine = CaffeineController(delegate: self, statusItem: statusItem)
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        caffeine!.shutdown()
    }
    
    // MARK: - CaffeineControllerDelegate
    
    func popUpStatusItemMenu() {
        statusItem.popUpMenu(menu)
    }
}
