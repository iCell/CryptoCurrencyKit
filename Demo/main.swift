//
//  main.swift
//  Demo
//
//  Created by Xiaoyu Li on 19/09/2017.
//

import Foundation
import CryptoCurrencyKit

CryptoCurrencyKit.fetchGlobal { r in
    switch r {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

RunLoop.main.run()
