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
    public let rank: String
    
    public let availableSupply: String?
    public let totalSupply: String?
    public let percentChange1h: String?
    public let percentChange24h: String?
    public let percentChange7d: String?
    public let lastUpdated: String
    
    public let priceBTC: String
    
    public let priceUSD: String
    public let volumeUSD24h: String?
    public let marketCapUSD: String?
    
    public let priceEUR: String?
    public let volumeEUR24h: String?
    public let marketCapEUR: String?
    
    public let priceGBP: String?
    public let volumeGBP24h: String?
    public let marketCapGBP: String?
    
    public let priceJPY: String?
    public let volumeJPY24h: String?
    public let marketCapJPY: String?
    
    public let priceCNY: String?
    public let volumeCNY24h: String?
    public let marketCapCNY: String?
    
    public let priceHKD: String?
    public let volumeHKD24h: String?
    public let marketCapHKD: String?
    
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

extension Ticker: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        symbol = try values.decode(String.self, forKey: .symbol)
        rank = try values.decode(String.self, forKey: .rank)

        availableSupply = try? values.decode(String.self, forKey: .availableSupply)
        totalSupply = try? values.decode(String.self, forKey: .totalSupply)
        percentChange1h = try? values.decode(String.self, forKey: .percentChange1h)
        percentChange24h = try? values.decode(String.self, forKey: .percentChange24h)
        percentChange7d = try? values.decode(String.self, forKey: .percentChange7d)
        lastUpdated = try values.decode(String.self, forKey: .lastUpdated)
        priceBTC = try values.decode(String.self, forKey: .priceBTC)
        priceUSD = try values.decode(String.self, forKey: .priceUSD)
        volumeUSD24h = try? values.decode(String.self, forKey: .volumeUSD24h)
        marketCapUSD = try? values.decode(String.self, forKey: .marketCapUSD)
        priceEUR = try? values.decode(String.self, forKey: .priceEUR)
        volumeEUR24h = try? values.decode(String.self, forKey: .volumeEUR24h)
        marketCapEUR = try? values.decode(String.self, forKey: .marketCapEUR)
        priceGBP = try? values.decode(String.self, forKey: .priceGBP)
        volumeGBP24h = try? values.decode(String.self, forKey: .volumeGBP24h)
        marketCapGBP = try? values.decode(String.self, forKey: .marketCapGBP)
        priceCNY = try? values.decode(String.self, forKey: .priceCNY)
        volumeCNY24h = try? values.decode(String.self, forKey: .volumeCNY24h)
        marketCapCNY = try? values.decode(String.self, forKey: .marketCapCNY)
        priceHKD = try? values.decode(String.self, forKey: .priceHKD)
        volumeHKD24h = try? values.decode(String.self, forKey: .volumeHKD24h)
        marketCapHKD = try? values.decode(String.self, forKey: .marketCapHKD)
        priceJPY = try? values.decode(String.self, forKey: .priceJPY)
        volumeJPY24h = try? values.decode(String.self, forKey: .volumeJPY24h)
        marketCapJPY = try? values.decode(String.self, forKey: .marketCapJPY)
    }
}

