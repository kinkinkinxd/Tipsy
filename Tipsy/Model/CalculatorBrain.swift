//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by กิตติธัช อิงคสมภพ on 8/9/2566 BE.
//  Copyright © 2566 BE The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var finalResult = ""
    var billResult = 0.0
    var totalTip = 0.2

    func getResult() -> String {
        return finalResult
    }
    func getTip() -> Int {
        return Int(totalTip * 100)
    }
    
    mutating func calculateResult(bill: Double, numberOfPeople: Int) {
        billResult = (bill * (1 + totalTip)) / Double(numberOfPeople)
        finalResult = String(format: "%.2f", billResult)
    }
    
    mutating func calculateTip(tip: Double) {
        totalTip = tip / 100
    }
    
}
