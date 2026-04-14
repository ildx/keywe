import Foundation

/// Configuration loader for Keywe settings
public class ConfigLoader {
    
    // MARK: - Properties
    public static let shared = ConfigLoader()
    
    // MARK: - Initialization
    private init() {}
    
    // MARK: - Public Methods
    
    /// Load configuration from default location
    public func loadConfiguration() -> Configuration {
        // This would actually load from a file in a real implementation
        return Configuration()
    }
    
    /// Save configuration to default location
    public func saveConfiguration(_ config: Configuration) {
        // This would save to a file in a real implementation
    }
}

/// Main configuration structure for Keywe
public struct Configuration {
    public var hyperKeyConfig: HyperKeyConfig
    public var windowTilingConfig: WindowTilingConfig
    public var appSwitcherConfig: AppSwitcherConfig
    
    public init() {
        self.hyperKeyConfig = HyperKeyConfig()
        self.windowTilingConfig = WindowTilingConfig()
        self.appSwitcherConfig = AppSwitcherConfig()
    }
}

/// Hyper Key configuration
public struct HyperKeyConfig {
    public var isEnabled: Bool
    public var keyMapping: [String: String]
    
    public init() {
        self.isEnabled = true
        self.keyMapping = [:]
    }
}

/// Window tiling configuration
public struct WindowTilingConfig {
    public var isEnabled: Bool
    public var gridColumns: Int
    public var gridRows: Int
    
    public init() {
        self.isEnabled = true
        self.gridColumns = 3
        self.gridRows = 3
    }
}

/// App switcher configuration
public struct AppSwitcherConfig {
    public var isEnabled: Bool
    public var switcherType: SwitcherType
    
    public init() {
        self.isEnabled = true
        self.switcherType = .application
    }
}

public enum SwitcherType {
    case application
    case window
    case recent
}