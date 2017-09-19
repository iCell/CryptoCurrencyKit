//
//  Global.swift
//  CoinCurrency
//
//  Created by Xiaoyu Li on 19/09/2017.
//

public struct Global {
    let bitCoinPercentageOfMarketCap: Double
    let activeCurrencies: Int
    let activeAssets: Int
    let activeMarkets: Int
    
    let totalMarketCapUSD: Double
    let totalVolumeUSD24h: Double
    
    let totalMarketCapEUR: Double?
    let totalVolumeEUR24h: Double?
    
    let totalMarketCapGBP: Double?
    let totalVolumeGBP24h: Double?
    
    let totalMarketCapJPY: Double?
    let totalVolumeJPY24h: Double?
    
    let totalMarketCapCNY: Double?
    let totalVolumeCNY24h: Double?
    
    let totalMarketCapHKD: Double?
    let totalVolumeHKD24h: Double?
    
    enum CodingKeys: String, CodingKey {
        case bitCoinPercentageOfMarketCap = "bitcoin_percentage_of_market_cap"
        case activeCurrencies = "active_currencies"
        case activeAssets = "active_assets"
        case activeMarkets = "active_markets"
        
        case totalMarketCapUSD = "total_market_cap_usd"
        case totalVolumeUSD24h = "total_24h_volume_usd"
        
        case totalMarketCapEUR = "total_market_cap_eur"
        case totalVolumeEUR24h = "total_24h_volume_eur"
        
        case totalMarketCapGBP = "total_market_cap_gbp"
        case totalVolumeGBP24h = "total_24h_volume_gbp"
        
        case totalMarketCapJPY = "total_market_cap_jpy"
        case totalVolumeJPY24h = "total_24h_volume_jpy"
        
        case totalMarketCapCNY = "total_market_cap_cny"
        case totalVolumeCNY24h = "total_24h_volume_cny"
        
        case totalMarketCapHKD = "total_market_cap_hkd"
        case totalVolumeHKD24h = "total_24h_volume_hkd"
    }
}

extension Global: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(bitCoinPercentageOfMarketCap, forKey: .bitCoinPercentageOfMarketCap)
        try container.encode(activeCurrencies, forKey: .activeCurrencies)
        try container.encode(activeAssets, forKey: .activeAssets)
        try container.encode(activeMarkets, forKey: .activeMarkets)
        try container.encode(totalMarketCapUSD, forKey: .totalMarketCapUSD)
        try container.encode(totalVolumeUSD24h, forKey: .totalVolumeUSD24h)
        try container.encode(totalMarketCapEUR, forKey: .totalMarketCapEUR)
        try container.encode(totalVolumeEUR24h, forKey: .totalVolumeEUR24h)
        try container.encode(totalMarketCapGBP, forKey: .totalMarketCapGBP)
        try container.encode(totalVolumeGBP24h, forKey: .totalVolumeGBP24h)
        try container.encode(totalMarketCapJPY, forKey: .totalMarketCapJPY)
        try container.encode(totalVolumeJPY24h, forKey: .totalVolumeJPY24h)
        try container.encode(totalMarketCapCNY, forKey: .totalMarketCapCNY)
        try container.encode(totalVolumeCNY24h, forKey: .totalVolumeCNY24h)
        try container.encode(totalMarketCapHKD, forKey: .totalMarketCapHKD)
        try container.encode(totalVolumeHKD24h, forKey: .totalVolumeHKD24h)
    }
}

extension Global: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        bitCoinPercentageOfMarketCap = try values.decode(Double.self, forKey: .bitCoinPercentageOfMarketCap)
        activeCurrencies = try values.decode(Int.self, forKey: .activeCurrencies)
        activeAssets = try values.decode(Int.self, forKey: .activeAssets)
        activeMarkets = try values.decode(Int.self, forKey: .activeMarkets)
        totalMarketCapUSD = try values.decode(Double.self, forKey: .totalMarketCapUSD)
        totalVolumeUSD24h = try values.decode(Double.self, forKey: .totalVolumeUSD24h)
        totalMarketCapEUR = try? values.decode(Double.self, forKey: .totalMarketCapEUR)
        totalVolumeEUR24h = try? values.decode(Double.self, forKey: .totalVolumeEUR24h)
        totalMarketCapGBP = try? values.decode(Double.self, forKey: .totalMarketCapGBP)
        totalVolumeGBP24h = try? values.decode(Double.self, forKey: .totalVolumeGBP24h)
        totalMarketCapJPY = try? values.decode(Double.self, forKey: .totalMarketCapJPY)
        totalVolumeJPY24h = try? values.decode(Double.self, forKey: .totalVolumeJPY24h)
        totalMarketCapCNY = try? values.decode(Double.self, forKey: .totalMarketCapCNY)
        totalVolumeCNY24h = try? values.decode(Double.self, forKey: .totalVolumeCNY24h)
        totalMarketCapHKD = try? values.decode(Double.self, forKey: .totalMarketCapHKD)
        totalVolumeHKD24h = try? values.decode(Double.self, forKey: .totalVolumeHKD24h)
    }
}
