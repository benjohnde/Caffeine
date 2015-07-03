//
//  AppDelegate.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSMenuDelegate {
    @IBOutlet weak var menu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let caffeine: CaffeineInjector = CaffeineInjector()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setupStatusBar()
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // NSTask should be closed automatically
    }
    
    func setupStatusBar() {
        statusItem.target = self
        statusItem.highlightMode = false
        statusItem.image = getStatusIconClean()
        statusItem.action = Selector("toggleInjection:")
        statusItem.doubleAction = Selector("quitApplication:")
    }
    
    func showMenu() {
        statusItem.popUpStatusItemMenu(menu);
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
            statusItem.image = getStatusIconInjected()
            caffeine.inject()
        } else {
            statusItem.image = getStatusIconClean()
            caffeine.giveAntidote()
        }
    }
    
    func quitApplication(sender: NSStatusItem!) {
        NSApp.terminate(sender)
    }
}
