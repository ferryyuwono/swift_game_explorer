// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataCommon",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataCommon",
            targets: ["DataCommon"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.2")),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataCommon",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Swinject", package: "Swinject")
            ]
        ),
        .testTarget(
            name: "DataCommonTests",
            dependencies: ["DataCommon"]
        ),
    ]
)
