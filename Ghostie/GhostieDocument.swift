//
//  GhostieDocument.swift
//  Ghostie
//
//  Created by Richard Allen on 1/14/16.
//  Copyright © 2016 SoftwareDad. All rights reserved.
//

import Cocoa

class GhostieDocument: NSDocument {
    
    var image: NSImage?
    
    override init() {
        super.init()
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func readFromData(data: NSData, ofType typeName: String) throws {
        self.image = NSImage(data: data)
    }
}
