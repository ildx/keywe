import SwiftUI
import KeyweCore

@main
struct KeyweApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 400, minHeight: 300)
        }
        .windowToolbarStyle(UnifiedToolbarStyle())
        .commands {
            CommandGroup(replacing: .appInfo) {
                Button("About Keywe") {
                    // Show about dialog
                }
            }
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    private var hyperKeyManager: HyperKeyManager?
    private var accessibilityManager: AccessibilityManager?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Initialize managers
        setupManagers()
        
        // Request accessibility permissions if needed
        requestAccessibilityPermissions()
        
        // Enable hyper key functionality
        enableHyperKey()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Clean up resources
        hyperKeyManager?.disable()
    }
    
    private func setupManagers() {
        hyperKeyManager = HyperKeyManager.shared
        accessibilityManager = AccessibilityManager.shared
    }
    
    private func requestAccessibilityPermissions() {
        // Request accessibility permissions
        if !AccessibilityManager.shared.hasAccessibilityPermission() {
            AccessibilityManager.shared.requestAccessibilityPermission()
        }
    }
    
    private func enableHyperKey() {
        hyperKeyManager?.enable()
    }
}