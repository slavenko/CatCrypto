// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CatCrypto",
    platforms: [.iOS(.v12), .tvOS(.v12), .watchOS(.v4)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CatCrypto",
            targets: ["CatCrypto"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
//        .target(
//            name: "Once",
//            dependencies: [
//                .target(name: "OnceC")
//            ],
//            path: "Sources/Swift"

        .target(name: "Argon2",
                path: "Sources/ObjcSources/ModuleMaps/Argon2",
                publicHeadersPath: "ObjcHeader"),
        .target(name: "MD6",
                path: "Sources/ObjcSources/ModuleMaps/MD6",
                publicHeadersPath: "ObjcHeader"),
        .target(
                name: "SHA3",
                path: "Sources/ObjcSources/ModuleMaps/SHA3",
                publicHeadersPath: "ObjcHeader"),
        .target(
            name: "CatCrypto",
            dependencies: [.target(name: "Argon2"), .target(name: "MD6"), .target(name: "SHA3")],
            path: "Sources/SwiftSources"
        ),
        .testTarget(
            name: "CatCryptoTests",
            dependencies: ["CatCrypto"]),
    ],
    swiftLanguageVersions: [.v4]
)
