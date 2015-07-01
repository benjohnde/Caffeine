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
    let caffeine: CaffeineInjector = CaffeineInjector()
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let monitor = ProcessMonitor()
        monitor.fetch()
        let test = (monitor.isApplicationRunning("com.apple.Preview") ? "Yes" : "No")
        NSLog(test)
        caffeine.inject()
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
}
