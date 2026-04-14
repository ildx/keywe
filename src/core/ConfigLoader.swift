/*
 Configuration Loader for Keywe
 This file handles loading configuration from JSON/YAML files
 */

import Foundation

// MARK: - Configuration Structures
public struct HyperKeyConfig {
    let enabled: Bool
    let mapping: String
}

public struct WindowTilingConfig {
    let enabled: Bool
    let layouts: [String]
    let shortcuts: ShortcutsConfig
}

public struct AppSwitchingConfig {
    let enabled: Bool
    let shortcuts: ShortcutsConfig
}

public struct ShortcutsConfig {
    let tileLeft: String
    let tileRight: String
    let switchApps: String
    let launchApp: String
}

public struct Configuration {
    let hyperKey: HyperKeyConfig
    let windowTiling: WindowTilingConfig
    let appSwitching: AppSwitchingConfig
    let version: String // Configuration version for compatibility checking
}

// MARK: - Configuration Validator
public struct ConfigurationValidator {
    // Validate a configuration object
    public static func validate(_ config: Configuration) -> Bool {
        // Check that all required fields are valid
        return validateHyperKeyConfig(config.hyperKey) &&
               validateWindowTilingConfig(config.windowTiling) &&
               validateAppSwitchingConfig(config.appSwitching)
    }
    
    private static func validateHyperKeyConfig(_ config: HyperKeyConfig) -> Bool {
        // Validate that mapping is a valid keyboard input
        return !config.mapping.isEmpty
    }
    
    private static func validateWindowTilingConfig(_ config: WindowTilingConfig) -> Bool {
        // Validate that layouts contains at least one layout
        return !config.layouts.isEmpty
    }
    
    private static func validateAppSwitchingConfig(_ config: AppSwitchingConfig) -> Bool {
        // App switching config is valid if enabled or has valid shortcuts
        return true
    }
}

// MARK: - Configuration Loader Implementation
public class ConfigLoader {
    
    // User configuration directory path
    private static let userConfigDirectory = "\(NSHomeDirectory())/Library/Preferences/keywe"
    
    // System configuration directory path
    private static let systemConfigDirectory = "/etc/keywe"
    
    // Configuration file name
    private static let configFileName = "config.json"
    
    // Version of the current configuration format
    private static let configurationVersion = "1.0"
    
    // This function loads configuration from a file (JSON or YAML)
    public static func loadConfig(from filePath: String) -> Configuration? {
        // Check if file exists
        guard FileManager.default.fileExists(atPath: filePath) else {
            return nil
        }
        
        // Read file content
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
            return nil
        }
        
        // Determine file type by extension
        let fileExtension = (filePath as NSString).pathExtension.lowercased()
        
        switch fileExtension {
        case "json":
            return loadJSONConfig(from: data)
        case "toml":
            return loadTOMLConfig(from: data)
        default:
            return nil
        }
    }
    
    // Load configuration from JSON data
    private static func loadJSONConfig(from data: Data) -> Configuration? {
        do {
            // First, attempt to parse as JSON
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // Parse hyper key config
                guard let hyperKeyDict = jsonObject["hyperKey"] as? [String: Any] else { return nil }
                let hyperKeyConfig = HyperKeyConfig(
                    enabled: hyperKeyDict["enabled"] as? Bool ?? true,
                    mapping: hyperKeyDict["mapping"] as? String ?? "caps_lock"
                )
                
                // Parse window tiling config
                guard let windowTilingDict = jsonObject["windowTiling"] as? [String: Any] else { return nil }
                let windowTilingConfig = WindowTilingConfig(
                    enabled: windowTilingDict["enabled"] as? Bool ?? true,
                    layouts: windowTilingDict["layouts"] as? [String] ?? ["tile", "cascade", "maximize"],
                    shortcuts: parseShortcuts(from: windowTilingDict["shortcuts"] as? [String: Any] ?? [:])
                )
                
                // Parse app switching config
                guard let appSwitchingDict = jsonObject["appSwitching"] as? [String: Any] else { return nil }
                let appSwitchingConfig = AppSwitchingConfig(
                    enabled: appSwitchingDict["enabled"] as? Bool ?? true,
                    shortcuts: parseShortcuts(from: appSwitchingDict["shortcuts"] as? [String: Any] ?? [:])
                )
                
                // Extract version from config or set default
                let version = jsonObject["version"] as? String ?? "1.0"
                
                let config = Configuration(
                    hyperKey: hyperKeyConfig,
                    windowTiling: windowTilingConfig,
                    appSwitching: appSwitchingConfig,
                    version: version
                )
                
                // Validate the configuration
                if ConfigurationValidator.validate(config) {
                    return config
                }
            }
        } catch {
            return nil
        }
        
        return nil
    }
    
    // Load configuration from YAML data
    private static func loadYAMLConfig(from data: Data) -> Configuration? {
        // This is a simplified approach that would require a YAML library in a real implementation
        // For now, we'll just return nil as a placeholder for YAML parsing
        return nil
    }
    
    // Load configuration from TOML data
    private static func loadTOMLConfig(from data: Data) -> Configuration? {
        // This is a placeholder for TOML parsing
        // In a real implementation, this would use a TOML parsing library
        return nil
    }
    
    // Parse shortcut configuration from dictionary
    private static func parseShortcuts(from dict: [String: Any]) -> ShortcutsConfig {
        return ShortcutsConfig(
            tileLeft: dict["tileLeft"] as? String ?? "super+ctrl+left",
            tileRight: dict["tileRight"] as? String ?? "super+ctrl+right",
            switchApps: dict["switchApps"] as? String ?? "alt+tab",
            launchApp: dict["launchApp"] as? String ?? "super+enter"
        )
    }
    
    // This function returns default configuration
    public static func loadDefaultConfig() -> Configuration {
        return Configuration(
            hyperKey: HyperKeyConfig(enabled: true, mapping: "caps_lock"),
            windowTiling: WindowTilingConfig(
                enabled: true,
                layouts: ["tile", "cascade", "maximize"],
                shortcuts: ShortcutsConfig(
                    tileLeft: "super+ctrl+left",
                    tileRight: "super+ctrl+right",
                    switchApps: "alt+tab",
                    launchApp: "super+enter"
                )
            ),
            appSwitching: AppSwitchingConfig(
                enabled: true,
                shortcuts: ShortcutsConfig(
                    tileLeft: "super+ctrl+left",
                    tileRight: "super+ctrl+right",
                    switchApps: "alt+tab",
                    launchApp: "super+enter"
                )
            ),
            version: configurationVersion
        )
    }
    
    // Load configuration prioritizing user settings over system settings
    public static func loadConfiguration() -> Configuration {
        // First, try to load from user directory
        let userConfigPath = "\(userConfigDirectory)/\(configFileName)"
        if let userConfig = loadConfig(from: userConfigPath) {
            // If user config exists, validate and return it
            return userConfig
        }
        
        // If no user config, try system config
        let systemConfigPath = "\(systemConfigDirectory)/\(configFileName)"
        if let systemConfig = loadConfig(from: systemConfigPath) {
            // If system config exists, use it with fallback logic
            return systemConfig
        }
        
        // If neither exists, return default configuration
        return loadDefaultConfig()
    }
    
    // Initialize user configuration directory and default config file if needed
    public static func initializeUserConfig() {
        // Create user config directory if it doesn't exist
        do {
            try FileManager.default.createDirectory(
                atPath: userConfigDirectory,
                withIntermediateDirectories: true,
                attributes: nil
            )
            
            // Check if config file exists
            let configPath = "\(userConfigDirectory)/\(configFileName)"
            if !FileManager.default.fileExists(atPath: configPath) {
                // Create default config file
                let defaultConfig = loadDefaultConfig()
                let jsonString = toJSON(config: defaultConfig)
                try jsonString.write(toFile: configPath, atomically: true, encoding: .utf8)
            }
        } catch {
            // If we can't create directory or file, log error but continue with default config
            print("Warning: Could not initialize user configuration directory or file: \(error)")
        }
    }
    
    // Convert configuration to JSON string
    private static func toJSON(config: Configuration) -> String {
        // This is a simplified version for demonstration; in real scenario,
        // more sophisticated conversion logic would be needed
        return """
        {
            "version": "\(config.version)",
            "hyperKey": {
                "enabled": \(config.hyperKey.enabled),
                "mapping": "\(config.hyperKey.mapping)"
            },
            "windowTiling": {
                "enabled": \(config.windowTiling.enabled),
                "layouts": [\(config.windowTiling.layouts.map { "\"\($0)\"" }.joined(separator: ", "))],
                "shortcuts": {
                    "tileLeft": "\(config.windowTiling.shortcuts.tileLeft)",
                    "tileRight": "\(config.windowTiling.shortcuts.tileRight)",
                    "switchApps": "\(config.windowTiling.shortcuts.switchApps)",
                    "launchApp": "\(config.windowTiling.shortcuts.launchApp)"
                }
            },
            "appSwitching": {
                "enabled": \(config.appSwitching.enabled),
                "shortcuts": {
                    "tileLeft": "\(config.appSwitching.shortcuts.tileLeft)",
                    "tileRight": "\(config.appSwitching.shortcuts.tileRight)",
                    "switchApps": "\(config.appSwitching.shortcuts.switchApps)",
                    "launchApp": "\(config.appSwitching.shortcuts.launchApp)"
                }
            }
        }
        """
    }
}