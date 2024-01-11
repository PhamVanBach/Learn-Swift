//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Bach Pham on 15/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct TipsBrain {
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"

    mutating func CalculateTip(tipParam: Double) {
        tip = tipParam / 100
    }
    
    mutating func SetNumberOfPeople(numberOfPeopleParam: Int) {
        numberOfPeople = numberOfPeopleParam
    }
   
    mutating func CalculateTotal(bill: String) {
        billTotal = Double(bill) ?? 0
        let result = billTotal * (tip + 1) / Double(numberOfPeople)
        finalResult = formatBillTotal(billAmount: result)
    }
   
    func formatBillTotal(billAmount: Double) -> String {
        var billTotal = "0.0"
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: billAmount as NSNumber) {
            billTotal = formattedTipAmount
        }
        return billTotal
    }
    
    func isBillTotal(bill: String) -> Bool {
        return bill != ""
    }
}
