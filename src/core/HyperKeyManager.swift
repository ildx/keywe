/*
 Hyper Key Manager for Keywe
 This file handles the conversion of Caps Lock to Hyper Key functionality
 */

import Foundation
import AppKit

// MARK: - Hyper Key Manager
public class HyperKeyManager {
    
    // MARK: - Properties
    private let keyboardManager: KeyboardManager
    private var isCapsLockActive = false
    
    // MARK: - Singleton
    public static let shared = HyperKeyManager()
    
    // MARK: - Initializer
    private init() {
        self.keyboardManager = KeyboardManager.shared
    }
    
    // MARK: - Public Methods
    
    /// Enable hyper key functionality
    public func enable() {
        setupKeyboardMonitoring()
    }
    
    /// Disable hyper key functionality
    public func disable() {
        keyboardManager.stopMonitoring()
    }
    
    // MARK: - Private Methods
    
    /// Setup keyboard monitoring for Caps Lock detection
    private func setupKeyboardMonitoring() {
        keyboardManager.setKeyHandler { [weak self] event in
            self?.handleKeyboardEvent(event)
        }
        
        keyboardManager.startMonitoring()
    }
    
    /// Handle keyboard events to detect Caps Lock changes
    private func handleKeyboardEvent(_ event: NSEvent) {
        // Only handle key down and key up events for Caps Lock
        guard event.type == .keyDown || event.type == .keyUp else {
            return
        }
        
        // Check if this is a Caps Lock key event (key code 57)
        guard event.keyCode == 57 else {
            return
        }
        
        if event.type == .keyDown {
            isCapsLockActive = true
            // When Caps Lock is pressed, it acts as a Hyper Key
        } else if event.type == .keyUp {
            isCapsLockActive = false
        }
    }
}