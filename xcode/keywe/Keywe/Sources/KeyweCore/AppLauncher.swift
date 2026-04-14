import Foundation
import AppKit

/// Manages application launching functionality
public class AppLauncher {
    
    // MARK: - Singleton
    public static let shared = AppLauncher()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    
    /// Launch an application by bundle identifier
    public func launchApplication(withBundleIdentifier bundleIdentifier: String) -> Bool {
        let workspace = NSWorkspace.shared
        let appUrl = workspace.urlForApplication(withBundleIdentifier: bundleIdentifier)
        
        guard let url = appUrl else {
            return false
        }
        
        return workspace.open(url)
    }
    
    /// Launch an application by path
    public func launchApplication(atPath path: String) -> Bool {
        let workspace = NSWorkspace.shared
        return workspace.openFile(path)
    }
}