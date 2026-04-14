# Keywe Configuration Guide

This document explains how to configure Keywe to customize its behavior.

## Configuration File Format

Keywe supports configuration via JSON files. The configuration file should be named `config.json` and placed in the application's configuration directory.

## Configuration Structure

The configuration consists of three main sections:

### Hyper Key Configuration

```json
{
  "hyperKey": {
    "enabled": true,
    "mapping": "caps_lock"
  }
}
```

- `enabled`: Boolean indicating if Hyper Key functionality is active
- `mapping`: The key that should be converted to a Hyper Key (currently only supports "caps_lock")

### Window Tiling Configuration

```json
{
  "windowTiling": {
    "enabled": true,
    "layouts": ["tile", "cascade", "maximize"],
    "shortcuts": {
      "tileLeft": "super+ctrl+left",
      "tileRight": "super+ctrl+right",
      "switchApps": "alt+tab",
      "launchApp": "super+enter"
    }
  }
}
```

- `enabled`: Boolean indicating if window tiling is active
- `layouts`: Array of available window layouts
- `shortcuts`: Object containing keyboard shortcuts for various actions

### App Switching Configuration

```json
{
  "appSwitching": {
    "enabled": true,
    "shortcuts": {
      "tileLeft": "super+ctrl+left",
      "tileRight": "super+ctrl+right",
      "switchApps": "alt+tab",
      "launchApp": "super+enter"
    }
  }
}
```

- `enabled`: Boolean indicating if application switching is active
- `shortcuts`: Object containing keyboard shortcuts for app switching actions

## Default Configuration

When no configuration file is found, Keywe uses the default configuration which enables all features with standard keyboard shortcuts.