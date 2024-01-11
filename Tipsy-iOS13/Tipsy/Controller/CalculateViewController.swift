//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var stepperTitle: UILabel!

    @IBOutlet var zeroPercent: UIButton!
    @IBOutlet var tenPercent: UIButton!
    @IBOutlet var twentyPercent: UIButton!

    var tipsBrain = TipsBrain()
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPercent.isSelected = false
        tenPercent.isSelected = false
        twentyPercent.isSelected = false
        sender.isSelected = true

        let buttonTitle = sender.currentTitle!
        let buttonTitleDropLast = buttonTitle.dropLast()
        let buttonTitleAsNumber = Double(buttonTitleDropLast)!

        tipsBrain.CalculateTip(tipParam: buttonTitleAsNumber)
    }

    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus: UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { _ in
            toFocus.becomeFirstResponder()
        })
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion: nil)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperTitle.text = String(format: "%.0f", sender.value)
        tipsBrain.SetNumberOfPeople(numberOfPeopleParam: Int(sender.value))
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!

        if tipsBrain.isBillTotal(bill: bill) {
            tipsBrain.CalculateTotal(bill: bill)
        } else {
            alertWithTitle(title: "Alert", message: "Bill Total Can Not Empty", ViewController: self, toFocus: billTextField)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = tipsBrain.finalResult
            destinationVC.tip = Int(tipsBrain.tip * 100)
            destinationVC.numberOfPeople = tipsBrain.numberOfPeople
        }
    }
}
