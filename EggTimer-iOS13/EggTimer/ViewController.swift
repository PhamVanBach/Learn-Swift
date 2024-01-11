//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var processBar: UIProgressView!
    var player: AVAudioPlayer?

    let hardness = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var totalTimer = 0
    var secoundPassed = 0
    var secoundRemaining: Float = 0.0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        resetValue()
        totalTimer = hardness[sender.currentTitle!]!
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secoundPassed < totalTimer {
            secoundPassed += 1
            secoundRemaining = Float(secoundPassed) / Float(totalTimer)
            processBar.progress = secoundRemaining
        } else {
            timer.invalidate()
            playSound(soundName: "alarm_sound", customExtension: "mp3")
            statusLabel.text = "Done!"
            timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(resetValue), userInfo: nil, repeats: true)
        }
    }

    @objc func resetValue() {
        timer.invalidate()
        statusLabel.text = "How do you like your eggs?"
        secoundPassed = 0
        processBar.progress = 0.0
    }

    func playSound(soundName: String, customExtension: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: customExtension)
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
