//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Soni Suman on 30/06/20.
//  Copyright © 2020 Soni Suman. All rights reserved.
//

import UIKit
struct  CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), advice: "Eat more pies!!!")
        } else if bmiValue > 24.9 {
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), advice: "Fit as a fiddle!!!")
        } else {
            bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), advice: "Eat less pies!!!")
        }
    }
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
       
        return bmi?.color ??  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
