//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Bach Pham on 04/10/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let rate: Double
    var rateString: String {
        String(format: "%.1f", rate)
    }
}
