//
//  CaffeineInjector.swift
//  Caffeine
//
//  Created by Ben John on 10/05/15.
//  Copyright (c) 2015 Ben John. All rights reserved.
//

import Foundation
import IOKit.pwr_mgt

enum CaffeineStatus {
    case clean
    case injected
}

class CaffeineInjector {
    let reasonForActivity = "Mac stays awake all night long."
    var assertionID: IOPMAssertionID = IOPMAssertionID(0)
    var status: CaffeineStatus = CaffeineStatus.clean
    
    fileprivate func createAssertion() -> IOReturn {
        let type = kIOPMAssertPreventUserIdleDisplaySleep
        let level = IOPMAssertionLevel(kIOPMAssertionLevelOn)
        return IOPMAssertionCreateWithName(type as CFString!, level, reasonForActivity as CFString!, &assertionID)
    }
    
    func inject() {
        release()
        guard createAssertion() == kIOReturnSuccess else {
            print("Caffeine could not be injected,")
            return
        }
        status = CaffeineStatus.injected
    }
    
    func release() {
        guard status == CaffeineStatus.injected else { return }
        guard IOPMAssertionRelease(assertionID) == kIOReturnSuccess else {
            print("Caffeine could not be released.")
            return
        }
        status = CaffeineStatus.clean
    }
}
