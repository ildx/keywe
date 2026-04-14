/*
 Tests for ConfigLoader
 Unit tests for the configuration loading functionality
 */

import XCTest

class ConfigLoaderTests: XCTestCase {
    
    // Test that default configuration loads correctly
    func testDefaultConfigurationLoads() {
        let config = ConfigLoader.loadDefaultConfig()
        
        // Verify hyper key configuration
        XCTAssertTrue(config.hyperKey.enabled)
        XCTAssertEqual(config.hyperKey.mapping, "caps_lock")
        
        // Verify window tiling configuration
        XCTAssertTrue(config.windowTiling.enabled)
        XCTAssertFalse(config.windowTiling.layouts.isEmpty)
        XCTAssertEqual(config.windowTiling.layouts[0], "tile")
        XCTAssertEqual(config.windowTiling.layouts[1], "cascade")
        XCTAssertEqual(config.windowTiling.layouts[2], "maximize")
        
        // Verify shortcuts
        XCTAssertEqual(config.windowTiling.shortcuts.tileLeft, "super+ctrl+left")
        XCTAssertEqual(config.windowTiling.shortcuts.tileRight, "super+ctrl+right")
        XCTAssertEqual(config.windowTiling.shortcuts.switchApps, "alt+tab")
        XCTAssertEqual(config.windowTiling.shortcuts.launchApp, "super+enter")
        
        // Verify app switching configuration
        XCTAssertTrue(config.appSwitching.enabled)
    }
    
    // Test that configuration loading from JSON file works
    func testConfigFromFile() {
        // Create a temporary JSON configuration file
        let testConfig = """
        {
            "hyperKey": {
                "enabled": true,
                "mapping": "caps_lock"
            },
            "windowTiling": {
                "enabled": true,
                "layouts": ["tile", "cascade", "maximize"],
                "shortcuts": {
                    "tileLeft": "super+ctrl+left",
                    "tileRight": "super+ctrl+right",
                    "switchApps": "alt+tab",
                    "launchApp": "super+enter"
                }
            },
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
        """
        
        // Write to temp file
        let tempDir = FileManager.default.temporaryDirectory
        let tempFile = tempDir.appendingPathComponent("test_config.json")
        
        do {
            try testConfig.write(to: tempFile, atomically: true, encoding: .utf8)
            
            // Load config from file
            guard let loadedConfig = ConfigLoader.loadConfig(from: tempFile.path) else {
                XCTFail("Failed to load configuration from file")
                return
            }
            
            // Validate
            XCTAssertTrue(loadedConfig.hyperKey.enabled)
            XCTAssertEqual(loadedConfig.hyperKey.mapping, "caps_lock")
            XCTAssertTrue(loadedConfig.windowTiling.enabled)
            XCTAssertTrue(loadedConfig.appSwitching.enabled)
            
        } catch {
            XCTFail("Failed to write temp config file: \(error)")
        } finally {
            // Cleanup
            try? FileManager.default.removeItem(at: tempFile)
        }
    }
    
    // Test invalid configuration handling
    func testInvalidConfiguration() {
        // Test that an empty file returns nil
        let tempDir = FileManager.default.temporaryDirectory
        let tempFile = tempDir.appendingPathComponent("invalid_config.json")
        
        do {
            try "{}".write(to: tempFile, atomically: true, encoding: .utf8)
            
            // Load config from invalid file
            let result = ConfigLoader.loadConfig(from: tempFile.path)
            XCTAssertNil(result)
            
        } catch {
            XCTFail("Failed to write temp config file: \(error)")
        } finally {
            // Cleanup
            try? FileManager.default.removeItem(at: tempFile)
        }
    }
    
    // Test configuration validation
    func testConfigurationValidation() {
        let validConfig = ConfigLoader.loadDefaultConfig()
        XCTAssertTrue(ConfigurationValidator.validate(validConfig))
        
        // Test with empty mapping (should be invalid)
        let invalidConfig = Configuration(
            hyperKey: HyperKeyConfig(enabled: true, mapping: ""),
            windowTiling: validConfig.windowTiling,
            appSwitching: validConfig.appSwitching
        )
        
        XCTAssertFalse(ConfigurationValidator.validate(invalidConfig))
    }
}