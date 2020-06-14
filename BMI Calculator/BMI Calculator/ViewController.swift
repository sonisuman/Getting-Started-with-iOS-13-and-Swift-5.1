//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Soni Suman on 15/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f",sender.value)
        heightLabel.text = "\(height)m"
        print("heightSliderChanged==\(String(format: "%.2f",sender.value))")
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight.description)kg"
        print("weightSliderChanged==\(Int(sender.value))")
    }
    
    
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        //BMI = weight /height * height
        
        let BMI = weight / pow(height, 2)
        
        print("BMI ==", BMI)
    }
    
}

