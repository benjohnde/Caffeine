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
    private let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    private var caffeine: CaffeineController?
    
    @IBOutlet weak var menu: NSMenu!
    
    // MARK: - NSApplicationDelegate
    
    func applicationDidFinishLaunching(notification: NSNotification) {
        caffeine = CaffeineController(delegate: self, statusItem: statusItem)
    }
    
    func applicationWillTerminate(notification: NSNotification) {
        caffeine!.shutdown()
    }
    
    // MARK: - CaffeineControllerDelegate
    
    func popUpStatusItemMenu() {
        statusItem.popUpStatusItemMenu(menu)
    }
}
