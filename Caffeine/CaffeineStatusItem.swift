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
    fileprivate var delegate: CaffeineStatusItemDelegate
    fileprivate var statusItem: NSStatusItem
    
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
    
    @objc func toggleInjection(_ sender: AnyObject!) {
        delegate.toggleInjection()
    }
    
    @objc func popUpStatusItemMenu(_ sender: AnyObject!) {
        delegate.popUpStatusItemMenu()
    }
}

extension NSStatusBarButton {
    override open func rightMouseDown(with theEvent: NSEvent) {
        _ = target!.perform(.rightMouseDown)
    }
}
