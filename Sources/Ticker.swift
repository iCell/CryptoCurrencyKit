//
//  Ticker.swift
//  CoinCurrency
//
//  Created by Xiaoyu Li on 19/09/2017.
//

public struct Ticker {
    public let id: String
    public let name: String
    public let symbol: String
    public let rank: Int
    
    public let availableSupply: Double?
    public let totalSupply: Double?
    public let percentChange1h: Double?
    public let percentChange24h: Double?
    public let percentChange7d: Double?
    public let lastUpdated: Double?
    
    public let priceBTC: Double?
    
    public let priceUSD: Double?
    public let volumeUSD24h: Double?
    public let marketCapUSD: Double?
    
    public let priceEUR: Double?
    public let volumeEUR24h: Double?
    public let marketCapEUR: Double?
    
    public let priceGBP: Double?
    public let volumeGBP24h: Double?
    public let marketCapGBP: Double?
    
    public let priceJPY: Double?
    public let volumeJPY24h: Double?
    public let marketCapJPY: Double?
    
    public let priceCNY: Double?
    public let volumeCNY24h: Double?
    public let marketCapCNY: Double?
    
    public let priceHKD: Double?
    public let volumeHKD24h: Double?
    public let marketCapHKD: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case symbol
        case rank
        
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case percentChange1h = "percent_change_1h"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
        
        case priceBTC = "price_btc"
        
        case priceUSD = "price_usd"
        case volumeUSD24h = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        
        case priceEUR = "price_eur"
        case volumeEUR24h = "24h_volume_eur"
        case marketCapEUR = "market_cap_eur"
        
        case priceGBP = "price_gbp"
        case volumeGBP24h = "24h_volume_gbp"
        case marketCapGBP = "market_cap_gbp"
        
        case priceHKD = "price_hkd"
        case volumeHKD24h = "24h_volume_hkd"
        case marketCapHKD = "market_cap_hkd"
        
        case priceJPY = "price_jpy"
        case volumeJPY24h = "24h_volume_jpy"
        case marketCapJPY = "market_cap_jpy"
        
        case priceCNY = "price_cny"
        case volumeCNY24h = "24h_volume_cny"
        case marketCapCNY = "market_cap_cny"
    }
}

extension Ticker: Equatable {
    public static func ==(lhs: Ticker, rhs: Ticker) -> Bool {
        return lhs.id.hashValue == rhs.id.hashValue
    }
}

extension Ticker {
    public func price(for money: CryptoCurrencyKit.Money) -> Double? {
        switch money {
        case .cny:
            return priceCNY
        case .usd:
            return priceUSD
        case .eur:
            return priceEUR
        case .gbp:
            return priceGBP
        case .hkd:
            return priceHKD
        case .jpy:
            return priceJPY
        }
    }
    
    public func volume24h(for money: CryptoCurrencyKit.Money) -> Double? {
        switch money {
        case .cny:
            return volumeCNY24h
        case .usd:
            return volumeUSD24h
        case .eur:
            return volumeEUR24h
        case .gbp:
            return volumeGBP24h
        case .hkd:
            return volumeHKD24h
        case .jpy:
            return volumeJPY24h
        }
    }
    
    public func marketCap(for money: CryptoCurrencyKit.Money) -> Double? {
        switch money {
        case .cny:
            return marketCapCNY
        case .usd:
            return marketCapUSD
        case .eur:
            return marketCapEUR
        case .gbp:
            return marketCapGBP
        case .hkd:
            return marketCapHKD
        case .jpy:
            return marketCapJPY
        }
    }
}

extension Ticker: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(rank, forKey: .rank)
        try container.encode(availableSupply, forKey: .availableSupply)
        try container.encode(totalSupply, forKey: .totalSupply)
        try container.encode(percentChange1h, forKey: .percentChange1h)
        try container.encode(percentChange24h, forKey: .percentChange24h)
        try container.encode(percentChange7d, forKey: .percentChange7d)
        try container.encode(lastUpdated, forKey: .lastUpdated)
        try container.encode(priceBTC, forKey: .priceBTC)
        try container.encode(priceUSD, forKey: .priceUSD)
        try container.encode(volumeUSD24h, forKey: .volumeUSD24h)
        try container.encode(marketCapUSD, forKey: .marketCapUSD)
        try container.encode(priceEUR, forKey: .priceEUR)
        try container.encode(volumeEUR24h, forKey: .volumeEUR24h)
        try container.encode(marketCapEUR, forKey: .marketCapEUR)
        try container.encode(priceGBP, forKey: .priceGBP)
        try container.encode(volumeGBP24h, forKey: .volumeGBP24h)
        try container.encode(marketCapGBP, forKey: .marketCapGBP)
        try container.encode(priceCNY, forKey: .priceCNY)
        try container.encode(volumeCNY24h, forKey: .volumeCNY24h)
        try container.encode(marketCapCNY, forKey: .marketCapCNY)
        try container.encode(priceHKD, forKey: .priceHKD)
        try container.encode(volumeHKD24h, forKey: .volumeHKD24h)
        try container.encode(marketCapHKD, forKey: .marketCapHKD)
        try container.encode(priceJPY, forKey: .priceJPY)
        try container.encode(volumeJPY24h, forKey: .volumeJPY24h)
        try container.encode(marketCapJPY, forKey: .marketCapJPY)
    }
}

extension Ticker {
    public init(id: String, symbol: String, name: String, rank: Int, availableSupply: Double?, totalSupply: Double?, percentChange1h: Double?, percentChange24h: Double?, percentChange7d: Double?, lastUpdated: Double?, priceBTC: Double?, priceUSD: Double?, volumeUSD24h: Double?, marketCapUSD: Double?, priceEUR: Double?, volumeEUR24h: Double?, marketCapEUR: Double?, priceGBP: Double?, volumeGBP24h: Double?, marketCapGBP: Double?, priceJPY: Double?, volumeJPY24h: Double?, marketCapJPY: Double?, priceCNY: Double?, volumeCNY24h: Double?, marketCapCNY: Double?, priceHKD: Double?, volumeHKD24h: Double?, marketCapHKD: Double?) {
        self.init(id: id, name: name, symbol: symbol, rank: rank, availableSupply: availableSupply, totalSupply: totalSupply, percentChange1h: percentChange1h, percentChange24h: percentChange24h, percentChange7d: percentChange7d, lastUpdated: lastUpdated, priceBTC: priceBTC, priceUSD: priceUSD, volumeUSD24h: volumeUSD24h, marketCapUSD: marketCapUSD, priceEUR: priceEUR, volumeEUR24h: volumeUSD24h, marketCapEUR: marketCapEUR, priceGBP: priceGBP, volumeGBP24h: volumeGBP24h, marketCapGBP: marketCapGBP, priceJPY: priceJPY, volumeJPY24h: volumeJPY24h, marketCapJPY: marketCapJPY, priceCNY: priceCNY, volumeCNY24h: volumeCNY24h, marketCapCNY: marketCapCNY, priceHKD: priceHKD, volumeHKD24h: volumeHKD24h, marketCapHKD: marketCapHKD)
    }
}

extension Ticker: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        symbol = try values.decode(String.self, forKey: .symbol)
        rank =  try Int(values.decode(String.self, forKey: .rank))!

        if let availableSupplyTemp = try? values.decode(String.self, forKey: .availableSupply) {
            availableSupply = Double(availableSupplyTemp)
        } else {
            availableSupply = nil
        }
        if let totalSupplyTemp = try? values.decode(String.self, forKey: .totalSupply) {
            totalSupply = Double(totalSupplyTemp)
        } else {
            totalSupply = nil
        }
        if let lastUpdatedTemp = try? values.decode(String.self, forKey: .lastUpdated) {
            lastUpdated = Double(lastUpdatedTemp)
        } else {
            lastUpdated = nil
        }

        if let priceBTCTemp = try? values.decode(String.self, forKey: .priceBTC) {
            priceBTC = Double(priceBTCTemp)
        } else {
            priceBTC = nil
        }
        if let priceUSDTemp = try? values.decode(String.self, forKey: .priceUSD) {
            priceUSD = Double(priceUSDTemp)
        } else {
            priceUSD = nil
        }
        if let volumeUSD24hTemp = try? values.decode(String.self, forKey: .volumeUSD24h) {
            volumeUSD24h = Double(volumeUSD24hTemp)
        } else {
            volumeUSD24h = nil
        }
        if let marketCapUSDTemp = try? values.decode(String.self, forKey: .marketCapUSD) {
            marketCapUSD = Double(marketCapUSDTemp)
        } else {
            marketCapUSD = nil
        }
        
        if let percentChange1hTemp = try? values.decode(String.self, forKey: .percentChange1h) {
            percentChange1h = Double(percentChange1hTemp)
        } else {
            percentChange1h = nil
        }
        if let percentChange24hTemp = try? values.decode(String.self, forKey: .percentChange24h) {
            percentChange24h = Double(percentChange24hTemp)
        } else {
            percentChange24h = nil
        }
        if let percentChange7dtemp = try? values.decode(String.self, forKey: .percentChange7d) {
            percentChange7d = Double(percentChange7dtemp)
        } else {
            percentChange7d = nil
        }
        
        if let priceEURTemp = try? values.decode(String.self, forKey: .priceEUR) {
            priceEUR = Double(priceEURTemp)
        } else {
            priceEUR = nil
        }
        if let volumeEUR24hTemp = try? values.decode(String.self, forKey: .volumeEUR24h) {
            volumeEUR24h = Double(volumeEUR24hTemp)
        } else {
            volumeEUR24h = nil
        }
        if let marketCapEURTemp = try? values.decode(String.self, forKey: .marketCapEUR) {
            marketCapEUR = Double(marketCapEURTemp)
        } else {
            marketCapEUR = nil
        }
        
        if let priceGBPTemp = try? values.decode(String.self, forKey: .priceGBP) {
            priceGBP = Double(priceGBPTemp)
        } else {
            priceGBP = nil
        }
        if let volumeGBP24hTemp = try? values.decode(String.self, forKey: .volumeGBP24h) {
            volumeGBP24h = Double(volumeGBP24hTemp)
        } else {
            volumeGBP24h = nil
        }
        if let marketCapGBPTemp = try? values.decode(String.self, forKey: .marketCapGBP) {
            marketCapGBP = Double(marketCapGBPTemp)
        } else {
            marketCapGBP = nil
        }
        
        if let priceCNYTemp = try? values.decode(String.self, forKey: .priceCNY) {
            priceCNY = Double(priceCNYTemp)
        } else {
            priceCNY = nil
        }
        if let volumeCNY24hTemp = try? values.decode(String.self, forKey: .volumeCNY24h) {
            volumeCNY24h = Double(volumeCNY24hTemp)
        } else {
            volumeCNY24h = nil
        }
        if let marketCapCNYTemp = try? values.decode(String.self, forKey: .marketCapCNY) {
            marketCapCNY = Double(marketCapCNYTemp)
        } else {
            marketCapCNY = nil
        }
        
        if let priceHKDTemp = try? values.decode(String.self, forKey: .priceHKD) {
            priceHKD = Double(priceHKDTemp)
        } else {
            priceHKD = nil
        }
        if let volumeHKD24hTemp = try? values.decode(String.self, forKey: .volumeHKD24h) {
            volumeHKD24h = Double(volumeHKD24hTemp)
        } else {
            volumeHKD24h = nil
        }
        if let marketCapHKDTemp = try? values.decode(String.self, forKey: .marketCapHKD) {
            marketCapHKD = Double(marketCapHKDTemp)
        } else {
            marketCapHKD = nil
        }
        
        if let priceJPYTemp = try? values.decode(String.self, forKey: .priceJPY) {
            priceJPY = Double(priceJPYTemp)
        } else {
            priceJPY = nil
        }
        if let volumeJPY24hTemp = try? values.decode(String.self, forKey: .volumeJPY24h) {
            volumeJPY24h = Double(volumeJPY24hTemp)
        } else {
            volumeJPY24h = nil
        }
        if let marketCapJPYTemp = try? values.decode(String.self, forKey: .marketCapJPY) {
            marketCapJPY = Double(marketCapJPYTemp)
        } else {
            marketCapJPY = nil
        }
    }
}

