# Architecture Principles

## 1. Modular Design

- Each feature is implemented as a separate manager class
- Clear separation of concerns between components
- Dependency injection for testability

## 2. System Integration

- Uses native macOS APIs (AppKit, Foundation, NSWorkspace)
- Respects macOS accessibility permissions
- Follows macOS design patterns and conventions

## 3. Performance Considerations

- Minimal impact on system performance
- Efficient keyboard event handling
- Smooth window transitions