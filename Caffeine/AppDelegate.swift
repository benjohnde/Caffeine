//
//  AppDelegate.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    private let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let caffeine: CaffeineInjector = CaffeineInjector()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setupStatusBarItemMenu()
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func setupStatusBarItemMenu() {
        statusItem.image = getStatusIconClean()
        statusItem.target = self
        statusItem.action = Selector("toggleInjection:")
    }
    
    func getStatusIconClean() -> NSImage {
        let icon = NSImage(named: "statusIconClean")!
        icon.template = true
        return icon
    }
    
    func getStatusIconInjected() -> NSImage {
        let icon = NSImage(named: "statusIconInjected")!
        icon.template = true
        return icon
    }
    
    func toggleInjection(sender: NSStatusItem!) {
        if caffeine.status() == CaffeineStatus.Clean {
            caffeine.inject()
            statusItem.image = getStatusIconInjected()
        }
        if caffeine.status() == CaffeineStatus.Injected {
            caffeine.giveAntidote()
            statusItem.image = getStatusIconClean()
        }
    }
    
}
