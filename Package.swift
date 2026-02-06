// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftVisionKit",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SwiftVisionKit",
            targets: ["SwiftVisionKit"]
        )
    ],
    targets: [
        .target(
            name: "SwiftVisionKit",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftVisionKitTests",
            dependencies: ["SwiftVisionKit"]
        )
    ]
)

