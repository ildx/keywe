import Foundation
import AppKit

/// Manages global keyboard event monitoring
public class KeyboardManager {
    
    // MARK: - Properties
    private var eventMonitor: Any?
    private var keyHandler: ((NSEvent) -> Void)?
    
    // MARK: - Singleton
    public static let shared = KeyboardManager()
    
    // MARK: - Initialization
    public init() {}
    
    // MARK: - Public Methods
    
    /// Start monitoring keyboard events
    public func startMonitoring() {
        // Remove existing monitor if present
        stopMonitoring()
        
        // Create new event monitor for keyboard events
        eventMonitor = NSEvent.addGlobalMonitorForEvents(
            matching: [.keyDown, .keyUp],
            handler: { [weak self] event in
                self?.handleKeyEvent(event)
            }
        )
    }
    
    /// Stop monitoring keyboard events
    public func stopMonitoring() {
        if let monitor = eventMonitor {
            NSEvent.removeMonitor(monitor)
            eventMonitor = nil
        }
    }
    
    /// Set a handler for keyboard events
    public func setKeyHandler(_ handler: @escaping (NSEvent) -> Void) {
        keyHandler = handler
    }
    
    // MARK: - Private Methods
    
    /// Handle individual key events
    private func handleKeyEvent(_ event: NSEvent) {
        // Forward to custom handler if set
        keyHandler?(event)
    }
}
