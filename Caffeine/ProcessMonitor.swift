//
//  ProcessMonitor.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

class ProcessMonitor: NSObject {
    var runningApplications: [NSRunningApplication] = []
    
    func isApplicationRunning(bundleIdentifier: String) -> Bool {
        return runningApplications.contains({$0.bundleIdentifier == bundleIdentifier})
    }
    
    func fetch() {
        runningApplications = NSWorkspace.sharedWorkspace().runningApplications as [NSRunningApplication]
    }
    
    func test() {
        // let monitor = ProcessMonitor()
        // monitor.fetch()
        // let test = (monitor.isApplicationRunning("com.apple.Preview") ? "Yes" : "No")
        // NSLog(test)
    }
}
