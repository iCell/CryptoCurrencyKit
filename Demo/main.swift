//
//  main.swift
//  Demo
//
//  Created by Xiaoyu Li on 20/09/2017.
//

import Foundation
import CryptoCurrencyKit

CryptoCurrencyKit.fetchTickers { response in
    switch response {
    case .success(let data):
        print(data)
    case .failure(let error):
        print(error)
    }
}

RunLoop.main.run()
