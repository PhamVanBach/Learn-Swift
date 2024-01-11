//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Bach Pham on 15/09/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var resultSubText: UILabel!

    var result: String?
    var tip: Int?
    var numberOfPeople: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        resultSubText.text = "Split between \(numberOfPeople ?? 2) people, with \(tip ?? 10)% tip."
        // Do any additional setup after loading the view.
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
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
