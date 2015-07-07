//
//  ProcessMonitor.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

protocol ProcessMonitorDelegate {
    var caffeine: CaffeineInjector { get }
}

class ProcessMonitor: NSObject {
    private var delegate: ProcessMonitorDelegate?
    let privilegesApplications: [String] = ["com.apple.Preview", "com.apple.dt.Xcode"]
    var runningApplications: [NSRunningApplication] = []
    var timer: NSTimer?
    
    init(delegate: ProcessMonitorDelegate) {
        self.delegate = delegate
        super.init()
        // TODO objc selectors are evil under swift
        timer = NSTimer.scheduledTimerWithTimeInterval(30.0, target: self, selector: Selector("checkForRunningProcesses"), userInfo: nil, repeats: true)
    }
    
    func checkForRunningProcesses() {
        // TODO check for manual override
        fetch()
        if isPrivilegedApplicationRunning() {
            delegate?.caffeine.inject()
            return;
        }
        delegate?.caffeine.giveAntidote()
    }
    
    func fetch() {
        runningApplications = NSWorkspace.sharedWorkspace().runningApplications as [NSRunningApplication]
    }
    
    func isPrivilegedApplicationRunning() -> Bool {
        // TODO smoother method
        for application in privilegesApplications {
            if isApplicationRunning(application) {
                return true
            }
        }
        return false
    }
    
    func isApplicationRunning(bundleIdentifier: String) -> Bool {
        return runningApplications.contains({$0.bundleIdentifier == bundleIdentifier})
    }
}
