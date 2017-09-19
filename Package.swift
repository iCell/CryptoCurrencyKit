// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CryptoCurrencyKit",
    exclude: ["Sources/CoinCurrency",
              "Sources/Ticker.swift",
              "Sources/Global.swift"]
)
