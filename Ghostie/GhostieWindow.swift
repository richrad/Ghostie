//
//  GhostieWindow.swift
//  Ghostie
//
//  Created by Richard Allen on 1/13/16.
//  Copyright © 2016 SoftwareDad. All rights reserved.
//

import Cocoa

class GhostieWindow: NSWindow {
    
    override var canBecomeKeyWindow: Bool {
        return true
    }
    
    override var canBecomeMainWindow: Bool {
        return true
    }
    
}
