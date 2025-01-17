//
//  Calculator.swift
//  BMI Calculator
//
//  Created by Cansu Aktas on 2023-08-13.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue =  weight / pow(height, 2)
        
        switch bmiValue {
        case _ where bmiValue < 18.5: bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), adviceText: "Eat more pies")
        case _ where bmiValue > 24.9: bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), adviceText: "Eat less pies")
        default: bmi = BMI(value: bmiValue, color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), adviceText: "Fit as a fiddle")
        }
    }
    
    func getBMI() -> String? {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String? {
        return bmi?.adviceText
    }
    
    func getColor() -> UIColor? {
        return bmi?.color
    }
}
