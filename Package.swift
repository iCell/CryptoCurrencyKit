// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "CryptoCurrencyKit",
    products: [
        .library(
            name: "CryptoCurrencyKit",
            targets: ["CryptoCurrencyKit"]),
        ],
    targets: [
        .target(
            name: "CryptoCurrencyKit",
            path: ".",
            sources: ["Sources"])
    ]
)
