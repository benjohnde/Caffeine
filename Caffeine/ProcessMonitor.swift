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
    
    override init() {
        super.init()
    }
    
    func isApplicationRunning(bundleIdentifier: String) -> Bool {
        return contains(runningApplications, {$0.bundleIdentifier == bundleIdentifier})
    }
    
    func fetch() {
        runningApplications = NSWorkspace.sharedWorkspace().runningApplications as! [NSRunningApplication]
    }
}
