# Shared Implementation Details

## Phases

- [Phase 1 - Foundation](phase_1_foundation.md)
- [Phase 2 - Hyper key](phase_2_hyper_key.md)
- [Phase 3 - Window tiling](phase_3_window_tiling.md)
- [Phase 4 - App management](phase_4_app_management.md)
- [Phase 5 - Configuration](phase_5_configuration.md)
- [Phase 6 - Testing](phase_6_testing.md)

## TDD Process for Each Feature

1. **Write a failing test** that describes the desired behavior (very specific)
2. **Implement minimal code** to make the test pass
3. **Refactor** the implementation while keeping tests passing
4. **Repeat** until feature is complete

## Configuration File Structure

```json
{
  "hyper_key": {
    "enabled": true,
    "mapping": "caps_lock"
  },
  "window_tiling": {
    "enabled": true,
    "layouts": ["tile", "cascade", "maximize"],
    "shortcuts": {
      "tile_left": "super+ctrl+left",
      "tile_right": "super+ctrl+right"
    }
  },
  "app_switching": {
    "enabled": true,
    "shortcuts": {
      "switch_apps": "alt+tab",
      "launch_app": "super+enter"
    }
  }
}
```
