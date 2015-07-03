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
    let arguments = ["-disu", "-w \(NSProcessInfo.processInfo().processIdentifier)"]
    
    func inject() {
        giveAntidote()
        caffeinateTask = NSTask.launchedTaskWithLaunchPath("/usr/bin/caffeinate", arguments: arguments)
        if caffeinateTask?.running == false {
            caffeinateTask?.launch()
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
    
    func status() -> CaffeineStatus {
        if let task = caffeinateTask {
            if task.running {
                return CaffeineStatus.Injected
            }
        }
        return CaffeineStatus.Clean
    }
}
