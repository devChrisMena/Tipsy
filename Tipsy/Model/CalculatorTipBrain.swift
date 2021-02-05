//
//  CalculatorTipBrain.swift
//  Tipsy
//
//  Created by Christopher Mena on 2/4/21.
//

import Foundation
struct CalculateTipBrain {
    var tip: Double
    var numberOfPeople: Int
    var billTotal: Double
    var splitResult = ""
    
    init(tip: Double, numberOfPeople: Int, billTotal: Double) {
        self.tip = tip
        self.numberOfPeople = numberOfPeople
        self.billTotal = billTotal
    }
    
    func getSplitAmount() -> Double {
        let result = ((billTotal * tip) + billTotal) / Double(numberOfPeople)
        return result
    }
    
    func getTotalBillWithTip() -> Double {
        let result = billTotal + (billTotal * tip)
        return result
    }
    
    func getTotalBillWithTipText() -> String {
        let result = billTotal + (billTotal * tip)
        let text = String(format: "%.2f", result)
        return text
    }
    
    func getSplitAmountText() -> String {
        let result = ((billTotal * tip) + billTotal) / Double(numberOfPeople)
        let text = String(format: "%.2f", result)
        return text
    }
}
