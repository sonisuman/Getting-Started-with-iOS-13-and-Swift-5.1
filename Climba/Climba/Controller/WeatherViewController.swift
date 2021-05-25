//
//  WeatherViewController.swift
//  Climba
//
//  Created by Soni Suman on 22/05/21.
//

import UIKit



class WeatherViewController: UIViewController {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        weatherManager.delegate = self
        
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
    }
}

//MARK: - UITextfield delegate

extension WeatherViewController : UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.endEditing(true)
        print(textField.text!)
        return true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let cityName = textField.text {
            weatherManager.featchWeather(cityName)
        }
        textField.text = ""
    }
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        if textField.text != ""{
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
}

//MARK: - WeatherManager delegate

extension WeatherViewController : WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailedWithError(error: Error?) {
        print(error.debugDescription)
    }
    
}
