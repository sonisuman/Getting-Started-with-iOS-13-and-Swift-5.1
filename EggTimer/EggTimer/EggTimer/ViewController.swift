//
//  ViewController.swift
//  EggTimer
//
//  Created by Soni Suman on 31/05/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var remainingTime: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimer = ["Soft": 3, "Medium": 5,"Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondPassed = 0
    var progress : Float = 0.0
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         remainingTime.setProgress(0, animated: true)
        
    }
    
    @IBAction func hardNessClicked(_ sender: UIButton) {
        timer.invalidate()
        remainingTime.progress = 0.0
        secondPassed = 0
        guard let hardness = sender.currentTitle else {return}
        titleLabel.text = hardness
        guard let totalRequiredTime = eggTimer[hardness] else {return}
        totalTime = totalRequiredTime
        triggerTimer()
    }
    
    func triggerTimer() {
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
        
        if secondPassed < totalTime {
            secondPassed += 1
            progress = Float(secondPassed) / Float(totalTime)
             remainingTime.setProgress(progress, animated: true)
        } else {
            timer.invalidate()
            titleLabel.text = "Done !!!"
            playSound()
        }
    }
    
    func playSound() {
        
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()

        } catch let error {
            
            print(error.localizedDescription)
        }
    }


}

