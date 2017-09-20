# CryptoCurrencyKit


CryptoCurrencyKit is an API kit based on [CryptoCurrency Market Capitalizations](https://coinmarketcap.com/api/)


## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CryptoCurrencyKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'CryptoCurrencyKit'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CryptoCurrencyKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "iCell/CryptoCurrencyKit"
```

Run `carthage update` to build the framework and drag the built `CryptoCurrencyKit.framework` into your Xcode project.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Alamofire does support its use on supported platforms. 

Once you have your Swift package set up, adding Alamofire as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .Package(url: "https://github.com/iCell/CryptoCurrency.git")
]
```

## Usage

fetch tickers

```Swift
CryptoCurrencyKit.fetchTickers { response in
    switch response {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```

fetch a specific crypto currency

```Swift
CryptoCurrencyKit.fetchTicker(coinName: "BitCoin", convert: .jpy) { response in
    switch response {
    case .success(let bitCoin):
        print(bitCoin.priceJPY)
    case .failure(let error):
        print(error)
    }
}
```

fetch global data

```Swift
CryptoCurrencyKit.fetchGlobal(convert: .cny) { response in
    switch response {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}
```

## Author

iCell, icell.vip@gmail.com

## License

Alamofire is released under the MIT license. [See LICENSE](https://github.com/iCell/CryptoCurrency/blob/master/LICENSE)  for details.
