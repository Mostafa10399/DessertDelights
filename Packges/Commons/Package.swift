// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Commons",
    platforms: [.iOS(.v15)], 
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Commons",
            targets: ["Commons"]),
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMajor(from: "8.0.3")),
        .package(path: "../../NetworkLayer")],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Commons",
            dependencies: ["Kingfisher", 
                .product(name: "NetworkLayer", package: "NetworkLayer")]),
        .testTarget(
            name: "CommonsTests",
            dependencies: ["Commons"]),
    ]
)
