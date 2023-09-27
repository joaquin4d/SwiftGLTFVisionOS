// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGLTF",
    platforms: [
        .iOS("17.0"),
        .macOS("14.0"),
        .macCatalyst("17.0"),
        .visionOS("1.0")
    ],
    products: [
        .library(
            name: "SwiftGLTF",
            targets: ["SwiftGLTF"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/schwa/Everything", from: "0.4.4"),
        .package(url: "https://github.com/schwa/SIMD-Support", from: "0.2.1"),
    ],
    targets: [
        .target(
            name: "SwiftGLTF",
            dependencies: [
                "Everything",
                .product(name: "SIMDSupport", package: "SIMD-Support")
            ]
        ),
        .testTarget(
            name: "SwiftGLTFTests",
            dependencies: ["SwiftGLTF"],
            resources: [
                .copy("Box.gltf"),
                .copy("Box-byteStride.glb"),
            ]
        ),
    ]
)
