//
//  GhostieImageView.swift
//  Ghostie
//
//  Created by Richard Allen on 1/13/16.
//  Copyright © 2016 SoftwareDad. All rights reserved.
//

import Cocoa

class GhostieImageView: NSImageView {
    
    override var mouseDownCanMoveWindow: Bool {
        return true
    }
    
    override func becomeFirstResponder() -> Bool {
        return false
    }
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
}
