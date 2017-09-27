//
//  Global.swift
//  CoinCurrency
//
//  Created by Xiaoyu Li on 19/09/2017.
//

public struct Global {
    public let bitCoinPercentageOfMarketCap: Double
    public let activeCurrencies: Int
    public let activeAssets: Int
    public let activeMarkets: Int
    
    public let totalMarketCapUSD: Double
    public let totalVolumeUSD24h: Double
    
    public let totalMarketCapEUR: Double?
    public let totalVolumeEUR24h: Double?
    
    public let totalMarketCapGBP: Double?
    public let totalVolumeGBP24h: Double?
    
    public let totalMarketCapJPY: Double?
    public let totalVolumeJPY24h: Double?
    
    public let totalMarketCapCNY: Double?
    public let totalVolumeCNY24h: Double?
    
    public let totalMarketCapHKD: Double?
    public let totalVolumeHKD24h: Double?
    
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

extension Global {
    public init(activeCurrencies: Int, bitCoinPercentageOfMarketCap: Double, activeAssets: Int, activeMarkets: Int, totalMarketCapUSD: Double, totalVolumeUSD24h: Double, totalMarketCapEUR: Double?, totalVolumeEUR24h: Double?, totalMarketCapGBP: Double?, totalVolumeGBP24h: Double?, totalMarketCapJPY: Double?, totalVolumeJPY24h: Double?, totalMarketCapCNY: Double?, totalVolumeCNY24h: Double?, totalMarketCapHKD: Double?, totalVolumeHKD24h: Double?) {
        self.init(bitCoinPercentageOfMarketCap: bitCoinPercentageOfMarketCap, activeCurrencies: activeCurrencies, activeAssets: activeAssets, activeMarkets: activeMarkets, totalMarketCapUSD: totalMarketCapUSD, totalVolumeUSD24h: totalVolumeUSD24h, totalMarketCapEUR: totalMarketCapEUR, totalVolumeEUR24h: totalVolumeEUR24h, totalMarketCapGBP: totalMarketCapGBP, totalVolumeGBP24h: totalVolumeGBP24h, totalMarketCapJPY: totalMarketCapJPY, totalVolumeJPY24h: totalVolumeJPY24h, totalMarketCapCNY: totalMarketCapCNY, totalVolumeCNY24h: totalVolumeCNY24h, totalMarketCapHKD: totalMarketCapHKD, totalVolumeHKD24h: totalVolumeHKD24h)
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
