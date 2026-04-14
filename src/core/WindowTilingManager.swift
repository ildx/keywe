/*
 Window Tiling Manager for Keywe
 This file handles window tiling functionality using keyboard shortcuts
 */

import Foundation
import AppKit

// MARK: - Window Tiling Manager
public class WindowTilingManager {
    
    // MARK: - Properties
    private let keyboardManager: KeyboardManager
    private let accessibilityManager: AccessibilityManager
    private var isTilingEnabled = false
    
    // MARK: - Singleton
    public static let shared = WindowTilingManager()
    
    // MARK: - Initializer
    private init() {
        self.keyboardManager = KeyboardManager.shared
        self.accessibilityManager = AccessibilityManager.shared
    }
    
    // MARK: - Public Methods
    
    /// Enable window tiling functionality
    public func enable() {
        guard accessibilityManager.isAccessibilityPermissionGranted() else {
            accessibilityManager.requestAccessibilityPermission()
            return
        }
        
        setupKeyboardMonitoring()
        isTilingEnabled = true
    }
    
    /// Disable window tiling functionality
    public func disable() {
        keyboardManager.stopMonitoring()
        isTilingEnabled = false
    }
    
    /// Tile the active window to the left half of the screen
    public func tileLeft() {
        print("Tiling window to the left")
        // Implementation would go here
    }
    
    /// Tile the active window to the right half of the screen
    public func tileRight() {
        print("Tiling window to the right")
        // Implementation would go here
    }
    
    /// Maximize the active window to full screen
    public func maximize() {
        print("Maximizing window")
        // Implementation would go here
    }
    
    /// Cascade windows
    public func cascade() {
        print("Cascading windows")
        // Implementation would go here
    }
    
    // MARK: - Private Methods
    
    /// Setup keyboard monitoring for window tiling shortcuts
    private func setupKeyboardMonitoring() {
        keyboardManager.setKeyHandler { [weak self] event in
            self?.handleKeyboardEvent(event)
        }
        
        keyboardManager.startMonitoring()
    }
    
    /// Handle keyboard events to detect window tiling shortcuts
    private func handleKeyboardEvent(_ event: NSEvent) {
        guard event.type == .keyDown else { return }
        
        // Check for window tiling shortcuts
        if event.modifierFlags.contains(.control) && event.modifierFlags.contains(.command) {
            switch event.keyCode {
            case 123: // Left arrow key
                tileLeft()
            case 124: // Right arrow key
                tileRight()
            default:
                break
            }
        }
        
        // Check for maximize shortcut
        if event.modifierFlags.contains(.control) && event.modifierFlags.contains(.command) && event.modifierFlags.contains(.option) {
            maximize()
        }
    }
}