// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PresentationHome",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PresentationHome",
            targets: ["PresentationHome"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1"),
        .package(path: "../../Domain/DomainGame")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PresentationHome",
            dependencies: [
                .product(name: "Swinject", package: "Swinject"),
                .product(name: "DomainGame", package: "DomainGame")
            ]
        ),
        .testTarget(
            name: "PresentationHomeTests",
            dependencies: ["PresentationHome"]
        ),
    ]
)
