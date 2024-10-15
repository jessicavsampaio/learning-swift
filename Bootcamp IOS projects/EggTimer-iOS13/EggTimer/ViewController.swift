//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        progressBar.progress = 0.0
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        label.text = hardness
        let totalTime = eggTimes[hardness]!
        
        var secondsRemaining = totalTime
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            var progress = (Float(totalTime) - Float(secondsRemaining)) / Float(totalTime)
            self.progressBar.progress = progress
            
            if secondsRemaining > 0 {
                print ("\(secondsRemaining) seconds")
                secondsRemaining -= 1
            } else {
                Timer.invalidate()
                self.label.text = "Done!"
            }
        }
    }
}

