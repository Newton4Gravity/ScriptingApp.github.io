// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "ScriptingSDK",
    platforms: [
        .iOS("26.0")
    ],
    products: [
        .library(
            name: "ScriptingSDK",
            targets: ["ScriptingSDK"]
        )
    ],
    targets: [
        .target(
            name: "ScriptingSDK"
        ),
        .testTarget(
            name: "ScriptingSDKTests",
            dependencies: ["ScriptingSDK"]
        )
    ]
)
