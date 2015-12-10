//
//  CaffeineStatusItem.swift
//  Caffeine
//
//  Created by Ben John on 10/12/15.
//  Copyright © 2015 Ben John. All rights reserved.
//

import Cocoa

extension NSStatusBarButton {
    override public func rightMouseDown(theEvent: NSEvent) {
        target!.performSelector("popUpStatusItemMenu:")
    }
}

protocol CaffeineStatusItemDelegate {
    func toggleInjection()
    func popUpStatusItemMenu(statusItem: NSStatusItem)
}

class CaffeineStatusItem: NSObject {
    private let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    private var delegate: CaffeineStatusItemDelegate
    
    var statusIconClean: NSImage {
        get {
            let icon = NSImage(named: "statusIconClean")!
            icon.template = true
            return icon
        }
    }
    
    var statusIconInjected: NSImage {
        get {
            let icon = NSImage(named: "statusIconInjected")!
            icon.template = true
            return icon
        }
    }
    
    init(delegate: CaffeineStatusItemDelegate) {
        self.delegate = delegate
        super.init()
        statusItem.highlightMode = false
        if let button = statusItem.button {
            button.target = self
            button.action = "toggleInjection:"
        }
        showCleanStatusIcon()
    }
    
    func showCleanStatusIcon() {
        statusItem.button!.image = statusIconClean
    }
    
    func showInjectedStatusIcon() {
        statusItem.button!.image = statusIconInjected
    }
    
    // MARK: - NSStatusBarButton actions
    
    func popUpStatusItemMenu(sender: AnyObject!) {
        delegate.popUpStatusItemMenu(statusItem)
    }
    
    func toggleInjection(sender: AnyObject!) {
        self.delegate.toggleInjection()
    }
}
