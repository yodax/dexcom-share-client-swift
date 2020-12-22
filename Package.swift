// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ShareClient",
    defaultLocalization: "en",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "ShareClient", targets: ["ShareClient"]),
        .library(name: "ShareClientUI", targets: ["ShareClientUI"]),
        .library(name: "ShareClientPlugin", targets: ["ShareClientPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/LoopKit/LoopKit.git", .branch("package-experiment"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ShareClient",
            dependencies: ["LoopKit"],
            path: "ShareClient",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "ShareClientUI",
            dependencies: [
                "ShareClient",
                .product(name: "LoopKitUI", package: "LoopKit"),
                "LoopKit"],
            path: "ShareClientUI",
            exclude: ["Info.plist"]
        ),
        .target(
            name: "ShareClientPlugin",
            dependencies: [
                "ShareClient",
                "ShareClientUI",
                .product(name: "LoopKitUI", package: "LoopKit"),
                "LoopKit"],
            path: "ShareClientPlugin",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "ShareClientTests",
            dependencies: ["ShareClient"],
            path: "ShareClientTests",
            exclude: ["Info.plist"]
        ),
    ]
)
