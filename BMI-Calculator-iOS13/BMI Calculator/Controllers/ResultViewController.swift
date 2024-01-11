//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Bach Pham on 11/09/2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var bmiScore: UILabel!
    @IBOutlet var adviceText: UILabel!
    var bmiValue: Float?
    var backgroundColor: UIColor?
    var advice: String?

    var bmiBrain = BMIBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiScore.text = String(format: "%.2f", bmiValue ?? 0.0)
        adviceText.text = advice
        view.backgroundColor = backgroundColor
    }

    @IBAction func goBackToHome(_ sender: Any) {
        dismiss(animated: true)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
