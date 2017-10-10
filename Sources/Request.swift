//
//  Request.swift
//  CryptoCurrencyKit
//
//  Created by Xiaoyu Li on 30/09/2017.
//

import Foundation

public enum CCKError: Error {
    case invalidResponse
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
    
    public enum ResponseRaw {
        case failure(error: Error)
        case success(raw: Data)
    }
    
    static func requestA<T>(urlRequest: URLRequest, response: ((_ r: ResponseA<T>) -> Void)?) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let objects = try JSONDecoder().decode([T].self, from: data)
                        response?(ResponseA.success(objects))
                    } catch let decodeE {
                        response?(ResponseA.failure(error: decodeE))
                    }
                } else if let error = error {
                    response?(ResponseA.failure(error: error))
                } else {
                    response?(ResponseA.failure(error: CCKError.invalidResponse))
                }
            }
        }.resume()
    }
    
    static func requestD<T>(urlRequest: URLRequest, response: ((_ r: ResponseD<T>) -> Void)?) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let object = try JSONDecoder().decode(T.self, from: data)
                        response?(ResponseD.success(object))
                    } catch let decodeE {
                        response?(ResponseD.failure(error: decodeE))
                    }
                } else if let error = error {
                    response?(ResponseD.failure(error: error))
                } else {
                    response?(ResponseD.failure(error: CCKError.invalidResponse))
                }
            }
        }.resume()
    }
    
    static func requestRaw(urlRequest: URLRequest, response: ((_ r: ResponseRaw) -> Void)?) {
        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            DispatchQueue.main.async {
                if let data = data {
                    response?(ResponseRaw.success(raw: data))
                } else if let error = error {
                    response?(ResponseRaw.failure(error: error))
                } else {
                    response?(ResponseRaw.failure(error: CCKError.invalidResponse))
                }
            }
        }.resume()
    }
}
