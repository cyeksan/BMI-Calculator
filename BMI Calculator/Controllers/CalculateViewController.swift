//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
        
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        let heightString = String(format: "%.2f", sender.value)
        heightLabel.text = "\(heightString)m"
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let weightString = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weightString)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! ResultViewController
        if segue.identifier == "goToResult" {
            destinationVC.bmiValue = calculatorBrain.getBMI()
            destinationVC.color = calculatorBrain.getColor()
            destinationVC.adviceText = calculatorBrain.getAdvice()

        }
    }
    
}


