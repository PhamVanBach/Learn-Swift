//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!

    var bmiBrain = BMIBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightLabel.text = "\(heightSlider.value)m"
        weightLabel.text = "\(Int(weightSlider.value))kg"
    }

    @IBAction func goToResultView(_ sender: Any) {
        bmiBrain.calculateBMI(weight: weightSlider.value, height: heightSlider.value)
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    @IBAction func handleChangeHeight(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }

    @IBAction func hanleChangeWeight(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = bmiBrain.getBMIValue()
            destinationVC.backgroundColor = bmiBrain.getBackgroundColor()
            destinationVC.advice = bmiBrain.getAdvice()
        }
    }
}
