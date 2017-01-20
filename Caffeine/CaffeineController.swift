//
//  CaffeineController.swift
//  Caffeine
//
//  Created by Ben John on 10/12/15.
//  Copyright © 2015 Ben John. All rights reserved.
//

import Cocoa

protocol CaffeineControllerDelegate {
    func popUpStatusItemMenu()
}

class CaffeineController: CaffeineStatusItemDelegate {
    fileprivate var delegate: CaffeineControllerDelegate
    fileprivate var statusItem: CaffeineStatusItem?
    fileprivate let caffeine: CaffeineInjector = CaffeineInjector()
    
    init(delegate: CaffeineControllerDelegate, statusItem: NSStatusItem) {
        self.delegate = delegate
        self.statusItem = CaffeineStatusItem(delegate: self, statusItem: statusItem)
    }
    
    func shutdown() {
        caffeine.release()
    }
    
    // MARK: - CaffeineStatusItemDelegate
    
    func toggleInjection() {
        if caffeine.status == CaffeineStatus.clean {
            statusItem!.showInjectedStatusIcon()
            caffeine.inject()
            return
        }
        statusItem!.showCleanStatusIcon()
        caffeine.release()
    }
    
    func popUpStatusItemMenu() {
        delegate.popUpStatusItemMenu()
    }
}
