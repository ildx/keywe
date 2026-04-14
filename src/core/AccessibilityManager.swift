import Foundation
import ServiceManagement
import AppKit

/// Manages accessibility permissions for keyboard monitoring
public class AccessibilityManager {
    
    // MARK: - Properties
    public static let shared = AccessibilityManager()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    
    /// Check if accessibility permissions are granted
    public func isAccessibilityPermissionGranted() -> Bool {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt: false]
        return AXIsProcessTrustedWithOptions(options as? [String: Any])
    }
    
    /// Request accessibility permissions from the user
    public func requestAccessibilityPermission() {
        // This method would request user to grant accessibility permissions
        // In a real implementation, this would show user a dialog
        print("Please grant accessibility permissions in System Preferences")
    }
    
    /// Check and request accessibility permissions if needed
    public func validateAndRequestPermission() {
        if !isAccessibilityPermissionGranted() {
            requestAccessibilityPermission()
        }
    }
}
