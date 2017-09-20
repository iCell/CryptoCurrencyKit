import Foundation

public struct CryptoCurrencyKit {
    public enum Money: String {
        case usd = "USD"
        case eur = "EUR"
        case gbp = "GBP"
        case jpy = "JPY"
        case cny = "CNY"
        case hkd = "HKD"
    }
    
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
        let urlRequest = URLRequest.init(url: URL(string: "https://api.coinmarketcap.com/v1/global/")!)
        requestD(urlRequest: urlRequest, response: response)
    }
}

extension CryptoCurrencyKit {
    public enum ResponseD<T: Codable> {
        case failure(error: Error)
        case success(T)
    }
    
    public enum ResponseA<T: Codable> {
        case failure(error: Error)
        case success([T])
    }
    
    static func requestA<T>(urlRequest: URLRequest, response: ((_ r: ResponseA<T>) -> Void)?) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let data = data {
                do {
                    let objects = try JSONDecoder().decode([T].self, from: data)
                    response?(ResponseA.success(objects))
                } catch let decodeE {
                    response?(ResponseA.failure(error: decodeE))
                }
            } else if let error = error {
                response?(ResponseA.failure(error: error))
            }
            }.resume()
    }
    
    static func requestD<T>(urlRequest: URLRequest, response: ((_ r: ResponseD<T>) -> Void)?) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(T.self, from: data)
                    response?(ResponseD.success(object))
                } catch let decodeE {
                    response?(ResponseD.failure(error: decodeE))
                }
            } else if let error = error {
                response?(ResponseD.failure(error: error))
            }
        }.resume()
    }
}
