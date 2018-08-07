// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "WXKDarkSky",
    products: [
        .library(
            name: "WXKDarkSky",
            targets: ["WXKDarkSky"]),
    ],
    targets: [
        .target(
            name: "WXKDarkSky",
            dependencies: []),
        .testTarget(
            name: "WXKDarkSkyTests",
            dependencies: ["WXKDarkSky"]),
    ]
)
