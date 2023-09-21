//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    var numberOfPeople = 2
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPcn = buttonTitle.dropLast()
        
        let buttonTitleAsNum = Double(buttonTitleMinusPcn)!
        
        calculatorBrain.calculateTip(tip: buttonTitleAsNum)
    
    }
    
    @IBAction func stepValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            calculatorBrain.calculateResult(bill: Double(bill)!, numberOfPeople: numberOfPeople)
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = calculatorBrain.getResult()
            destinationVC.tip = calculatorBrain.getTip()
            destinationVC.split = numberOfPeople
        }
    }
    
}

