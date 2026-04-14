/*
 Integration Tests for Keywe
 Tests that all features work together properly
 */

// Integration test class for Keywe functionality
class IntegrationTests {
    
    // Test full integration of keyboard events with all managers
    func testAllFeaturesIntegration() {
        // Test configuration loading and integration
        let config = ConfigLoader.loadDefaultConfig()
        XCTAssertNotNil(config)
        
        // Test all managers can work with the same configuration
        let hyperKeyManager = HyperKeyManager(config: config)
        let windowTilingManager = WindowTilingManager(config: config)
        let appLauncher = AppLauncher(config: config)
        let appSwitcher = AppSwitcher(config: config)
        
        // All managers should be initialized successfully
        XCTAssertNotNil(hyperKeyManager)
        XCTAssertNotNil(windowTilingManager)
        XCTAssertNotNil(appLauncher)
        XCTAssertNotNil(appSwitcher)
    }
    
    // Test configuration reload functionality
    func testConfigurationReload() {
        // Load default config
        let initialConfig = ConfigLoader.loadDefaultConfig()
        XCTAssertNotNil(initialConfig)
        
        // Change some config values
        let newConfig = Configuration(
            hyperKey: HyperKeyConfig(enabled: false, mapping: "caps_lock"),
            windowTiling: initialConfig.windowTiling,
            appSwitching: initialConfig.appSwitching
        )
        
        // Verify config can be changed
        XCTAssertFalse(newConfig.hyperKey.enabled)
        
        // Test that managers can handle config updates
        let hyperKeyManager = HyperKeyManager(config: newConfig)
        XCTAssertFalse(hyperKeyManager.isHyperKeyEnabled)
    }
    
    // Test edge cases across all features
    func testEdgeCases() {
        // Test with invalid configuration
        let invalidConfig = Configuration(
            hyperKey: HyperKeyConfig(enabled: true, mapping: ""),
            windowTiling: WindowTilingManager.defaultConfig.windowTiling,
            appSwitching: AppSwitcher.defaultConfig.appSwitching
        )
        
        // This should be invalid according to our validation
        XCTAssertFalse(ConfigurationValidator.validate(invalidConfig))
        
        // Test loading default config
        let defaultConfig = ConfigLoader.loadDefaultConfig()
        XCTAssertTrue(ConfigurationValidator.validate(defaultConfig))
    }
}