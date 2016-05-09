//
//  BaristaStatusItem.swift
//  Barista
//
//  Created by Ben John on 10/12/15.
//  Copyright © 2015 Ben John. All rights reserved.
//

import Cocoa

private extension Selector {
    static let leftMouseDown = #selector(CaffeineStatusItem.toggleInjection(_:))
    static let rightMouseDown = #selector(CaffeineStatusItem.popUpStatusItemMenu(_:))
}

protocol CaffeineStatusItemDelegate {
    func toggleInjection()
    func popUpStatusItemMenu()
}

class CaffeineStatusItem: NSObject {
    private var delegate: CaffeineStatusItemDelegate
    private var statusItem: NSStatusItem
    
    init(delegate: CaffeineStatusItemDelegate, statusItem: NSStatusItem) {
        self.delegate = delegate
        self.statusItem = statusItem
        super.init()
        statusItem.highlightMode = false
        if let button = statusItem.button {
            button.target = self
            button.action = .leftMouseDown
        }
        showCleanStatusIcon()
    }
    
    func showCleanStatusIcon() {
        statusItem.button!.image = StatusIcon.clean
    }
    
    func showInjectedStatusIcon() {
        statusItem.button!.image = StatusIcon.injected
    }
    
    // MARK: - NSStatusBarButton actions
    
    func toggleInjection(sender: AnyObject!) {
        delegate.toggleInjection()
    }
    
    func popUpStatusItemMenu(sender: AnyObject!) {
        delegate.popUpStatusItemMenu()
    }
}

extension NSStatusBarButton {
    override public func rightMouseDown(theEvent: NSEvent) {
        target!.performSelector(.rightMouseDown)
    }
}
