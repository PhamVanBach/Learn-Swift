//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var firstChoice: UIButton!
    @IBOutlet var secoundChoice: UIButton!
    @IBOutlet var thirdChoice: UIButton!

    @IBOutlet var processBar: UIProgressView!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func handlePressAnswer(_ sender: UIButton) {
        let userGotRight = quizBrain.checkAnswer(sender.currentTitle!)
        if userGotRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }

    @objc func updateUI() {
        let quizAnswers = quizBrain.getQuizAnswers()
        processBar.progress = quizBrain.getProcess()
        questionLabel.text = quizBrain.getQuizQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        firstChoice.setTitle(quizAnswers[0], for: .normal)
        secoundChoice.setTitle(quizAnswers[1], for: .normal)
        thirdChoice.setTitle(quizAnswers[2], for: .normal)

        firstChoice.backgroundColor = UIColor.clear
        secoundChoice.backgroundColor = UIColor.clear
        thirdChoice.backgroundColor = UIColor.clear
    }
}
