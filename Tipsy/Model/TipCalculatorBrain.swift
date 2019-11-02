//
//  tipCalculatorBrain.swift
//  Tipsy
//
//  Created by Kyle Wiltshire on 11/2/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculatorBrain {
    var splitAmount: String?
    var selectedTip: String = "10%"
    
    mutating func getBillPerPerson (totalAmount: Double, noOfPeople: Double, tipAmount: Double) {
        let billWithTip = totalAmount * (1 + tipAmount)
        let billPerPerson = billWithTip / noOfPeople
        
        splitAmount = String(format:"%.2f", billPerPerson)
    }
    
    func getSplitAmount() -> String {
        return self.splitAmount!
    }
    
    func getSelectedTip() -> String {
        return self.selectedTip
    }
}
