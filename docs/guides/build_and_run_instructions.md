# Building and Running Keywe

## Prerequisites

- macOS 12 or later
- Xcode 14 or later (available from Mac App Store)
- Swift 5.7 or later

## Building from Source

### Option 1: Using Xcode (Recommended for Development)

1. Open the Xcode project:
   ```bash
   open /Users/iivo/Development/keywe/xcode/keywe/Keywe.xcodeproj
   ```

2. Select your target device (Mac)

3. Click the "Run" button (▶️) or press `Cmd + R`

### Option 2: Using Swift Package Manager

1. Navigate to the project directory:
   ```bash
   cd /Users/iivo/Development/keywe
   ```

2. Build the project:
   ```bash
   swift build
   ```

3. Run the application:
   ```bash
   swift run
   ```

## Development Workflow

1. Make changes to source files in `src/` directory
2. Build and run using either method above
3. Test functionality in the running application

## Troubleshooting

### Accessibility Permissions
If you encounter accessibility permission issues, ensure:
- The app is properly installed in your Applications folder
- Accessibility permissions are granted in System Preferences → Security & Privacy → Privacy → Accessibility

### Build Issues
If build fails:
- Ensure Xcode command line tools are installed: `xcode-select --install`
- Clean build: `swift package clean` then rebuild