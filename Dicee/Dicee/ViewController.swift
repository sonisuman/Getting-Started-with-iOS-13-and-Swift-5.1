//
//  ViewController.swift
//  Dicee
//
//  Created by Soni Suman on 28/04/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageview2: UIImageView!
    let diceImagesArr = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func rollButton(_ sender: UIButton) {
        diceImageView1.image = diceImagesArr.randomElement()
        diceImageview2.image = diceImagesArr.randomElement()
    }
}

