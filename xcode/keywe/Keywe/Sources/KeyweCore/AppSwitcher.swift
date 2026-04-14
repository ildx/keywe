import Foundation
import AppKit

/// Manages application switching functionality
public class AppSwitcher {
    
    // MARK: - Singleton
    public static let shared = AppSwitcher()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    
    /// Switch to the next application
    public func switchToNextApp() {
        NSWorkspace.shared.activatePreviousSpace()
    }
    
    /// Switch to the previous application
    public func switchToPreviousApp() {
        NSWorkspace.shared.activateNextSpace()
    }
    
    /// Switch to application by bundle identifier
    public func switchToApp(withBundleIdentifier bundleIdentifier: String) {
        let workspace = NSWorkspace.shared
        let appUrl = workspace.urlForApplication(withBundleIdentifier: bundleIdentifier)
        
        if let url = appUrl {
            workspace.launchApplication(at: url)
        }
    }
}