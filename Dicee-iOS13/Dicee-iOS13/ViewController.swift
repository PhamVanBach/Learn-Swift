//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var diceImageViewOne: UIImageView!
    @IBOutlet var diceImageViewTwo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImageViewOne.image = UIImage(imageLiteralResourceName: "DiceTwo")
        diceImageViewTwo.image = UIImage(imageLiteralResourceName: "DiceFour")
    }

    func randomNumber(start: Int, end: Int) -> Int {
        return Int.random(in: start ... end)
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArr = [UIImage(imageLiteralResourceName: "DiceOne"), UIImage(imageLiteralResourceName: "DiceTwo"), UIImage(imageLiteralResourceName: "DiceThree"), UIImage(imageLiteralResourceName: "DiceFour"), UIImage(imageLiteralResourceName: "DiceFive"), UIImage(imageLiteralResourceName: "DiceSix")]
        diceImageViewOne.image = diceArr[randomNumber(start: 1, end: 5)]
        diceImageViewTwo.image = diceArr[randomNumber(start: 1, end: 5)]
    }
}
