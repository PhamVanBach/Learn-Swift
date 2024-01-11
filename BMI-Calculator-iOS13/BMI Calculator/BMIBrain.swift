//
//  BMIBrain.swift
//  BMI Calculator
//
//  Created by Bach Pham on 11/09/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct BMIBrain {
    var bmi: BMI?

    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }

    func getBackgroundColor() -> UIColor {
        return bmi?.backgroundColor ?? UIColor.cyan
    }

    func getAdvice() -> String {
        return bmi?.advice ?? "keep going!"
    }

    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, backgroundColor: UIColor.blue, advice: "eat more food!")
        } else if bmiValue < 29.5 {
            bmi = BMI(value: bmiValue, backgroundColor: UIColor.cyan, advice: "keep going!")
        } else {
            bmi = BMI(value: bmiValue, backgroundColor: UIColor.red, advice: "do some excercise!")
        }
    }
}
