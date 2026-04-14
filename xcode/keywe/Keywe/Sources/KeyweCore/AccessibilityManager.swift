import Foundation
import AppKit

/// Manages accessibility permissions for the application
public class AccessibilityManager {
    
    // MARK: - Singleton
    public static let shared = AccessibilityManager()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    
    /// Check if accessibility permission has been granted
    public func hasAccessibilityPermission() -> Bool {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt as String: false]
        return AXIsProcessTrustedWithOptions(options)
    }
    
    /// Request accessibility permission from the user
    public func requestAccessibilityPermission() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt as String: true]
        AXIsProcessTrustedWithOptions(options)
    }
}