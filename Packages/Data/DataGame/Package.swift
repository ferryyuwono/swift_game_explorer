// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataGame",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataGame",
            targets: ["DataGame"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.0")),
        .package(path: "../DataCommon"),
        .package(path: "../../Domain/DomainGame")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataGame",
            dependencies: [
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "DataCommon", package: "DataCommon"),
                .product(name: "DomainGame", package: "DomainGame")
            ]
        ),
        .testTarget(
            name: "DataGameTests",
            dependencies: ["DataGame"]
        ),
    ]
)
