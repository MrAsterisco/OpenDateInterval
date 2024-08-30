// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "OpenDateInterval",
    products: [
        .library(
            name: "OpenDateInterval",
            targets: ["OpenDateInterval"]),
    ],
    targets: [
        .target(
            name: "OpenDateInterval"),
        .testTarget(
            name: "OpenDateIntervalTests",
            dependencies: ["OpenDateInterval"]),
    ]
)
