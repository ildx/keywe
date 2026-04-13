// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "KeyweApp",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "KeyweApp",
            targets: ["KeyweApp"]
        ),
    ],
    targets: [
        .target(
            name: "KeyweApp",
            dependencies: []
        ),
    ]
)