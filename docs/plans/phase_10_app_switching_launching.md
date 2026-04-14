# Phase 10: Application Switching and Launching

## Summary

This phase focuses on implementing the application switching and launching functionality that currently only exists as placeholders. We'll integrate with macOS APIs to properly switch between and launch applications.

## Goals

1. Implement actual application switching using NSWorkspace APIs
2. Implement application launching with proper bundle identifier resolution
3. Integrate with existing keyboard shortcut handling
4. Add proper error handling for app operations

## Implementation Details

### Application Switching

- Implement `switchToNextApp()` using NSWorkspace methods
- Implement `switchToPreviousApp()` using NSWorkspace methods
- Implement `switchToApp(byBundleIdentifier:)` for specific app switching
- Implement `switchToApp(byName:)` for app switching by name

### Application Launching

- Implement `launchApp(byBundleIdentifier:)` using NSWorkspace
- Implement `launchApp(byName:)` for launching apps by name
- Implement `launchApp(atPath:)` for launching apps from specific paths
- Add bundle identifier resolution capabilities

### Integration

- Connect with the existing keyboard manager for shortcut handling
- Use existing configuration for shortcut definitions
- Add proper error handling for app switching/launching errors

## Task Breakdown

1. Research and implement NSWorkspace APIs for application switching
2. Implement application launching functionality
3. Add bundle identifier resolution logic
4. Connect to existing keyboard shortcut handling
5. Implement error handling and validation
6. Test basic application switching/launching

## Unresolved Questions

1. **What is the intended behavior for the Hyper Key mapping beyond just detecting Caps Lock?**
   - Resolution: The Hyper Key mapping should be configurable and support different key mappings like:
     - Caps Lock (default behavior)
     - Command key
     - Option key
     - Control key
     - Any combination of these keys to act as the hyper key for custom shortcuts