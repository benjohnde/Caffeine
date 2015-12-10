//
//  CaffeineInjector.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Foundation

enum CaffeineStatus {
    case Clean
    case Injected
}

class CaffeineInjector {
    let taskQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
    let arguments = ["-disu", "-w \(NSProcessInfo.processInfo().processIdentifier)"]
    var caffeinateTask: NSTask
    
    init() {
        caffeinateTask = NSTask()
    }
    
    var status: CaffeineStatus {
        get {
            if caffeinateTask.running {
                return CaffeineStatus.Injected
            }
            return CaffeineStatus.Clean
        }
    }
    
    func inject() {
        giveAntidote()
        dispatch_async(taskQueue) {
            self.caffeinateTask = NSTask.launchedTaskWithLaunchPath("/usr/bin/caffeinate", arguments: self.arguments)
        }
    }
    
    func giveAntidote() {
        if caffeinateTask.running {
            caffeinateTask.terminate()
        }
    }
}
