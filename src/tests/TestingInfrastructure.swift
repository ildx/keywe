import Foundation

// Testing infrastructure for Keywe application

// This file would contain common test utilities and setup
// For now it's a placeholder showing the intended structure

public struct TestConstants {
    public static let testCapsLockKey = 57
}

// Helper functions for testing keyboard events
public func createTestKeyEvent(type: NSEvent.EventType, keyCode: UInt16, modifiers: NSEvent.ModifierFlags = []) -> NSEvent {
    // This is a placeholder - actual implementation would need to create proper test events
    return NSEvent.keyEvent(
        with: type,
        location: NSPoint.zero,
        modifierFlags: modifiers,
        timestamp: 0,
        windowNumber: 0,
        context: nil,
        characters: "",
        charactersIgnoringModifiers: "",
        isARepeat: false,
        keyCode: keyCode
    ) ?? NSEvent()
}
