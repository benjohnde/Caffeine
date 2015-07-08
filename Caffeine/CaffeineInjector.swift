//
//  CaffeineInjector.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Cocoa

enum CaffeineStatus {
    case Clean
    case Injected
}

class CaffeineInjector: NSObject {
    var caffeinateTask: NSTask?
    var automatedInjection = false
    let arguments = ["-disu", "-w \(NSProcessInfo.processInfo().processIdentifier)"]
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    
    func inject() {
        giveAntidote()
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            self.caffeinateTask = NSTask.launchedTaskWithLaunchPath("/usr/bin/caffeinate", arguments: self.arguments)
        }
    }
    
    func giveAntidote() {
        if let task = caffeinateTask {
            if task.running {
                task.terminate()
                caffeinateTask = nil
            }
        }
    }
    
    func mayGiveAntidote() {
        if automatedInjection {
            giveAntidote()
        }
    }
    
    func status() -> CaffeineStatus {
        if let task = caffeinateTask {
            if task.running {
                return CaffeineStatus.Injected
            }
        }
        return CaffeineStatus.Clean
    }
}
