//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Soni Suman on 29/04/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImageview: UIImageView!
    let ballArr = [ #imageLiteral(resourceName: "ball1"),#imageLiteral(resourceName: "ball2"),#imageLiteral(resourceName: "ball3"),#imageLiteral(resourceName: "ball4"),#imageLiteral(resourceName: "ball5")]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonPresses(_ sender: UIButton) {
        
        ballImageview.image = ballArr.randomElement()
        
    }
    
}

