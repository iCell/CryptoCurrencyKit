//
//  Graph.swift
//  CryptoCurrencyKit
//
//  Created by Xiaoyu Li on 30/09/2017.
//

import Foundation

public enum Graph: String {
    case marketCap = "market_cap_by_available_supply"
    case priceUSD = "price_usd"
    case priceBTC = "price_btc"
}

public struct GraphLine: Codable {
    public let value: Double
    public let timestamp: Double
}
