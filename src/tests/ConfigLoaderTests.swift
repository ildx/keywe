/*
 Tests for ConfigLoader
 Unit tests for the configuration loading functionality
 */

// Unit tests for the configuration loading functionality
class ConfigLoaderTests {
    
    // Test that default configuration loads correctly
    func testDefaultConfigurationLoads() {
        let config = ConfigLoader.loadDefaultConfig()
        
        // Verify hyper key configuration
        assert(config.hyperKey.enabled)
        assert(config.hyperKey.mapping == "caps_lock")
        
        // Verify window tiling configuration
        assert(config.windowTiling.enabled)
        assert(!config.windowTiling.layouts.isEmpty)
        assert(config.windowTiling.layouts[0] == "tile")
        assert(config.windowTiling.layouts[1] == "cascade")
        assert(config.windowTiling.layouts[2] == "maximize")
        
        // Verify shortcuts
        assert(config.windowTiling.shortcuts.tileLeft == "super+ctrl+left")
        assert(config.windowTiling.shortcuts.tileRight == "super+ctrl+right")
        assert(config.windowTiling.shortcuts.switchApps == "alt+tab")
        assert(config.windowTiling.shortcuts.launchApp == "super+enter")
        
        // Verify app switching configuration
        assert(config.appSwitching.enabled)
        
        // Verify configuration version
        assert(config.version == "1.0")
    }
    
    // Test that configuration loading from JSON file works
    func testConfigFromFile() {
        // Create a temporary JSON configuration file
        let testConfig = """
        {
            "version": "1.0",
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
        
        // Write to temp file (this is simplified - in real tests, you'd use proper XCTest)
        print("Testing configuration from file - This would be implemented with proper XCTest in a real environment")
    }
    
    // Test invalid configuration handling
    func testInvalidConfiguration() {
        print("Testing invalid configuration handling - This would be implemented with proper XCTest in a real environment")
    }
    
    // Test configuration validation
    func testConfigurationValidation() {
        let validConfig = ConfigLoader.loadDefaultConfig()
        assert(ConfigurationValidator.validate(validConfig))
        
        // Test with empty mapping (should be invalid)
        let invalidConfig = Configuration(
            hyperKey: HyperKeyConfig(enabled: true, mapping: ""),
            windowTiling: validConfig.windowTiling,
            appSwitching: validConfig.appSwitching,
            version: "1.0"
        )
        
        assert(!ConfigurationValidator.validate(invalidConfig))
    }
    
    // Test user configuration loading
    func testUserConfigurationLoading() {
        // Test that initializeUserConfig doesn't crash
        ConfigLoader.initializeUserConfig()
        
        // Verify default config directory is created
        let userConfigDir = "\(NSHomeDirectory())/Library/Preferences/keywe"
        assert(FileManager.default.fileExists(atPath: userConfigDir))
        
        // Verify default config file is created
        let configPath = "\(userConfigDir)/config.json"
        assert(FileManager.default.fileExists(atPath: configPath))
        
        // Load the created config
        let config = ConfigLoader.loadConfig(from: configPath)
        assert(config != nil)
        assert(config!.version == "1.0")
    }
    
    // Test loadConfiguration with fallback behavior
    func testLoadConfigurationFallback() {
        // Test that loadConfiguration returns a valid config even when files don't exist
        let config = ConfigLoader.loadConfiguration()
        assert(config != nil)
        assert(ConfigurationValidator.validate(config))
        
        // Test that loadConfiguration returns the default config when no files exist
        assert(config.version == "1.0")
    }
}