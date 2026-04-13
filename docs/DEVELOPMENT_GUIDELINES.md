# Development Guidelines for Keywe

This document provides guidelines and instructions for developing the Keywe macOS application.

## Project Overview

Keywe is a macOS productivity application that provides three core features:

1. Hyper Key functionality (Caps Lock to Hyper Key)
2. Window tiling with keyboard shortcuts
3. Application launching/switching with keyboard shortcuts

## Architecture Principles

### 1. Modular Design

- Each feature is implemented as a separate manager class
- Clear separation of concerns between components
- Dependency injection for testability

### 2. System Integration

- Uses native macOS APIs (AppKit, Foundation, NSWorkspace)
- Respects macOS accessibility permissions
- Follows macOS design patterns and conventions

### 3. Performance Considerations

- Minimal impact on system performance
- Efficient keyboard event handling
- Smooth window transitions

## Code Style Guidelines

### Naming Conventions

- Use descriptive names for variables and functions
- Follow Swift naming conventions (camelCase for variables, PascalCase for classes)
- Prefix private methods with underscore (e.g., `_processKeyEvent()`)

### Documentation

- Document public APIs with clear explanations
- Use inline comments for complex logic
- Include parameter and return value descriptions

### Error Handling

- Use Swift's native error handling patterns
- Provide meaningful error messages
- Handle edge cases gracefully

## Key Components

### HyperKeyManager

- Handles global keyboard monitoring
- Manages Caps Lock to Hyper Key conversion
- Implements virtual key mapping

### WindowTiler

- Manages window positioning and sizing
- Implements tiling algorithms
- Handles multi-monitor support

### AppManager

- Manages application launching and switching
- Tracks recent applications
- Integrates with NSWorkspace

### ShortcutManager

- Registers and handles keyboard shortcuts
- Manages shortcut conflicts
- Provides shortcut validation

## Development Workflow

1. **Start with the core managers** - Implement HyperKeyManager first, then WindowTiler, then AppManager
2. **Test each component individually** - Create unit tests for each manager
3. **Integrate components** - Connect managers through the main application controller
4. **Add UI elements** - Create preferences window and status menu
5. **Test keyboard shortcuts** - Ensure all shortcuts work as expected
6. **Optimize performance** - Profile and optimize critical paths

## Testing Strategy

### Unit Tests

- Test each manager in isolation
- Test edge cases for window positioning
- Test keyboard event handling

### Integration Tests

- Test component interactions
- Test full workflows (e.g., Hyper Key + Window Tiling)
- Test application switching scenarios

### UI Tests

- Test preferences window interactions
- Test status menu functionality
- Test accessibility permission flows

## macOS-Specific Considerations

### Permissions

- Accessibility permissions required for global keyboard monitoring
- Full disk access may be needed for some application operations
- System preferences integration for permission management

### Accessibility

- Follow Apple's accessibility guidelines
- Ensure proper keyboard navigation
- Provide visual feedback for actions

## API Documentation

### Key APIs Used

- **NSEvent**: Global keyboard event monitoring
- **NSWorkspace**: Application management
- **NSRunningApplication**: Running application handling
- **NSWindow**: Window management
- **NSMenu**: Status bar menu implementation

### Frameworks

- AppKit: UI components and window management
- Foundation: Core data structures and utilities
- ServiceManagement: For system integration (if needed)

## Skill Management

Development skills are managed through the `scripts/setup-skills.sh` script which installs required skills using npx. This approach avoids committing external dependencies to the repository and ensures consistent skill versions across development environments.
