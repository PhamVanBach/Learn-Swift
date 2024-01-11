//
//  BMI.swift
//  BMI Calculator
//
//  Created by Bach Pham on 14/09/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMI {
    var value: Float
    var backgroundColor: UIColor
    var advice: String

    init(value: Float, backgroundColor: UIColor, advice: String) {
        self.value = value
        self.backgroundColor = backgroundColor
        self.advice = advice
    }
}
