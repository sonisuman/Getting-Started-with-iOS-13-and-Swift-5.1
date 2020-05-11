//
//  ViewController.swift
//  Xylophone
//
//  Created by Soni Suman on 04/05/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

    func playSound(_ source: String?) {
        guard let url = Bundle.main.url(forResource: source, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
      let   soundArr = ["A.wav","B.wav","C.wav","D.wav","E.wav","F.wav","G.wav"]
        var soundIndex = 0
        if sender.tag == 1 || sender.tag == soundArr.count {
           soundIndex = sender.tag - 1
        }
        else {
            soundIndex = sender.tag
        }
        playSound(soundArr[soundIndex].components(separatedBy: ".wav")[0])
    }
}

