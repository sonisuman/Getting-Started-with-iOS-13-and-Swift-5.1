//
//  ViewController.swift
//  Climba
//
//  Created by Soni Suman on 30/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManagers  = weatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
    }

    @IBAction func sesrchFieldPressed(_ sender: UITextField) {
        print(searchTextField.text!)
        searchTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cityName = textField.text {
            weatherManagers.fatchWeather(cityName: cityName)
        }
        searchTextField.text = ""
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.text = "Try Something.."
            return false
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
}

