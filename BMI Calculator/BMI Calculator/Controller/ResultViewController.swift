//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Soni Suman on 30/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        self.view.backgroundColor = color

    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
