//
//  Tipsy.swift
//  Tipsy
//
//  Created by Bach Pham on 15/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct Tipsy {
    var tip: Double
    var numberOfPeople: Int
    var billTotal: Double
    var finalResult: String
    init(tip: Double, numberOfPeople: Int, billTotal: Double, finalResult: String) {
        self.tip = tip
        self.numberOfPeople = numberOfPeople
        self.billTotal = billTotal
        self.finalResult = finalResult
    }
}
