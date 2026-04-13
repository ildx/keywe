# Agents

## Core Features

- Hyper Key functionality (Caps Lock to Hyper Key)
- Window tiling with keyboard shortcuts
- Application launching/switching with keyboard shortcuts

## Key Components

- HyperKeyManager: Global keyboard monitoring, Caps Lock conversion
- WindowTiler: Window positioning, sizing, tiling algorithms
- AppManager: Application launching, switching, NSWorkspace integration
- ShortcutManager: Keyboard shortcut registration, conflict handling

## macOS Integration

- Uses native APIs: NSEvent, NSWorkspace, NSRunningApplication, NSWindow, NSMenu
- Requires accessibility permissions
- Follows macOS design patterns and conventions
- Respects system accessibility guidelines

## Development Workflow

1. Implement core managers (HyperKeyManager → WindowTiler → AppManager)
2. Test each component individually
3. Integrate components through main application controller
4. Add UI elements (preferences window, status menu)
5. Test keyboard shortcuts and performance

## Plan Mode

- Be extremely concise. Sacrifice grammar for brevity.
- End every plan with a list of "Unresolved Questions" (if any).
