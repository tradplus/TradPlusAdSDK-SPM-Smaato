// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TradPlusSmaatoAdapter",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "TradPlusSmaatoAdapter",
            targets: ["TradPlusSmaatoAdapter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM.git",
            .exact("15.18.0")
        ),
        .package(
            url: "https://github.com/vervegroup/Smaato-ios-sdk-standalone.git",
            .exact("23.2.3")
        ),
    ],
    targets: [
        .target(
            name: "TradPlusSmaatoAdapter",
            dependencies: [
                .target(name: "TPSmaatoAdapter"),
                .product(name: "TradPlusAdSDK", package: "TradPlusAdSDK-SPM"),
                .product(name: "SmaatoSDK", package: "Smaato-ios-sdk-standalone"),
            ],
            path: ".",
            sources: ["Sources/TradPlusSmaatoAdapter/TradPlusSmaatoAdapter.swift"]
        ),
        .binaryTarget(
            name: "TPSmaatoAdapter",
            url: "https://github.com/tradplus/TradPlusAdSDK-SPM-Smaato/releases/download/15.18.0/TPSmaatoAdapter-15.18.0.xcframework.zip",
            checksum: "9eda51daed2c57d404ded1f9807b5c27500c2d116f499261be9ea9fc32be3ee1"
        ),
    ]
)
