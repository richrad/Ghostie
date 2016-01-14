//
//  GhostieViewController.swift
//  Ghostie
//
//  Created by Richard Allen on 1/13/16.
//  Copyright © 2016 SoftwareDad. All rights reserved.
//

import Cocoa

let KVOContext = UnsafeMutablePointer<Void>();

class GhostieViewController: NSViewController {
    
    @IBOutlet var imageView: GhostieImageView!
    var document: GhostieDocument? {
        return NSDocumentController.sharedDocumentController().documentForWindow(self.view.window!) as? GhostieDocument
    }
    
    dynamic var pinned = NSNumber(bool: false) {
        didSet {
            guard let window = self.view.window else { return }
            if self.pinned.boolValue {
                window.level = Int(CGWindowLevelKey.MaximumWindowLevelKey.rawValue)
            } else {
                window.level = 0
            }
        }
    }
    
    dynamic var opacity = 100 {
        didSet {
            guard let window = view.window else { return }
            window.alphaValue = CGFloat(self.opacity) * CGFloat(0.01)
        }
    }
    
    @IBOutlet var controlsView: NSVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("receivedNotification:"), name: NSWindowDidBecomeMainNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("receivedNotification:"), name: NSWindowDidResignMainNotification, object: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let window = self.view.window {
            window.movableByWindowBackground = true
            window.titlebarAppearsTransparent = true
            window.titleVisibility = .Hidden
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        if let document = self.document {
            self.imageView.image = document.image
        }
    }
    
    func receivedNotification(notification: NSNotification) {
        guard let window = self.view.window else { return }
        if notification.name == NSWindowDidBecomeMainNotification {
            if window.mainWindow {
                self.controlsView.alphaValue = 1.0
            }
        } else if notification.name == NSWindowDidResignMainNotification {
            if !window.mainWindow {
                self.controlsView.alphaValue = 0.0
            }
        }
    }
}
