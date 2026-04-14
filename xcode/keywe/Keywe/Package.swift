// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Keywe",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "Keywe",
            targets: ["Keywe"]
        ),
    ],
    targets: [
        .target(
            name: "Keywe",
            dependencies: []
        ),
    ]
)