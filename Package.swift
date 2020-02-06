// swift-tools-version:5.1

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
