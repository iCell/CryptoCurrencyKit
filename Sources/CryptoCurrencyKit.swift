import Foundation

public struct CryptoCurrencyKit {
    
    public static func fetchTickers(convert: Money = .usd, limit: Int? = nil, response: ((_ r: ResponseA<Ticker>) -> Void)?) {
        var urlString = "https://api.coinmarketcap.com/v1/ticker/"
        urlString.append("?convert=\(convert.rawValue)")
        if let limit = limit {
            urlString.append("&limit=\(limit)")
        }
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        requestA(urlRequest: urlRequest, response: response)
    }
    
    public static func fetchTicker(coinName: String, convert: Money = .usd, response: ((_ r: ResponseD<Ticker>) -> Void)?) {
        var urlString = "https://api.coinmarketcap.com/v1/ticker/"
        urlString.append(coinName)
        urlString.append("/?convert=\(convert.rawValue)")
        let urlRequest = URLRequest(url: URL(string: urlString)!)
        let closure: ((ResponseA<Ticker>) -> Void)? = { r in
            switch r {
            case .success(let data):
                response?(ResponseD.success(data[0]))
            case .failure(let error):
                response?(ResponseD.failure(error: error))
            }
        }
        requestA(urlRequest: urlRequest, response: closure)
    }
    
    public static func fetchGlobal(convert: Money = .usd, response: ((_ r: ResponseD<Global>) -> Void)?) {
        let urlRequest = URLRequest(url: URL(string: "https://api.coinmarketcap.com/v1/global/")!)
        requestD(urlRequest: urlRequest, response: response)
    }
    
    public static func fetchGraph(_ graph: Graph, for coin: String, from fromDate: Date, to toDate: Date, response: ((_ r: ResponseA<GraphLine>) -> Void)?) {
        let fromInterval = Int(fromDate.timeIntervalSince1970 * 1000)
        let toInterval = Int(toDate.timeIntervalSince1970 * 1000)
        let urlRequest = URLRequest(url: URL(string: "https://graphs.coinmarketcap.com/currencies/\(coin)/\(fromInterval)/\(toInterval)/")!)
        requestRaw(urlRequest: urlRequest) { r in
            switch r {
            case .success(let data):
                do {
                    if let decoded = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: [[Double]]], let values = decoded[graph.rawValue] {
                        let lines = values.flatMap { ele -> GraphLine? in
                            if ele.count == 2 {
                                return GraphLine(value: ele[1], timestamp: ele[0])
                            } else {
                                return nil
                            }
                        }
                        response?(ResponseA.success(lines))
                    } else {
                        response?(ResponseA.failure(error: CCKError.invalidResponse))
                    }
                } catch {
                    response?(ResponseA.failure(error: error))
                }
            case .failure(let error):
                response?(ResponseA.failure(error: error))
            }
        }
    }
}

extension CryptoCurrencyKit {
    public enum Money: String {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
        case jpy = "JPY"
        case cny = "CNY"
        case hkd = "HKD"
        
        public var symbol: String {
            switch self {
            case .cny:
                return "¥"
            case .eur:
                return "€"
            case .gbp:
                return "£"
            case .jpy:
                return "¥"
            case .usd:
                return "$"
            case .hkd:
                return "$"
            }
        }
        
        public static var allValues: [Money] {
            return [.usd, .eur, .gbp, .jpy, .cny, .hkd]
        }
        
        public static var allRawValues: [String] {
            return allValues.map { $0.rawValue }
        }
    }
}
