//
//  main.swift
//  Demo
//
//  Created by Xiaoyu Li on 20/09/2017.
//

import Foundation
import CryptoCurrencyKit

func fetchTickers() {
    CryptoCurrencyKit.fetchTickers { r in
        switch r {
        case .success(let tickers):
            print(tickers)
        case .failure(let error):
            print(error)
        }
    }
}

func fetchBitcoin() {
    CryptoCurrencyKit.fetchTicker(coinName: "BitCoin", convert: .jpy) { r in
        switch r {
        case .success(let bitCoin):
            print(bitCoin)
        case .failure(let error):
            print(error)
        }
    }
}

func fetchGlobal() {
    CryptoCurrencyKit.fetchGlobal(convert: .hkd) { r in
        switch r {
        case .success(let global):
            print(global)
        case .failure(let error):
            print(error)
        }
    }
}

func fetchGraph() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    
    let from = dateFormatter.date(from: "2016-01-01")!
    let to = dateFormatter.date(from: "2017-01-01")!
    
    CryptoCurrencyKit.fetchGraph(.priceUSD, from: from, to: to) { r in
        switch r {
        case .success(let lines):
            print(lines)
        case .failure(let error):
            print(error)
        }
    }
}

RunLoop.main.run()
