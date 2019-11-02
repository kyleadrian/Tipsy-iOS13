//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CaclulatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var tipCalculatorBrain = TipCalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipCalculatorBrain.selectedTip = "0%"
        case "10%":
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipCalculatorBrain.selectedTip = "10%"
        case "20%":
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            
            tipCalculatorBrain.selectedTip = "20%"
        default:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            
            tipCalculatorBrain.selectedTip = "0%"
        }
      
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let formattedStepValue = String(format:"%.0f",stepper.value)
        splitNumberLabel.text = formattedStepValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billAmount = Double(billTextField.text!)
        let splitNumber = Double(splitNumberLabel.text!)
        
        if zeroPctButton.isSelected {
            let tip = 0.00
            
            tipCalculatorBrain.getBillPerPerson(totalAmount: billAmount!, noOfPeople: splitNumber!, tipAmount: tip)
            
        } else if tenPctButton.isSelected {
            let tip = 0.10
            
            tipCalculatorBrain.getBillPerPerson(totalAmount: billAmount!, noOfPeople: splitNumber!, tipAmount: tip)
        } else {
            let tip = 0.20
            
            tipCalculatorBrain.getBillPerPerson(totalAmount: billAmount!, noOfPeople: splitNumber!, tipAmount: tip)
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVc = segue.destination as! ResultsViewController;
            destinationVc.splitAmount = tipCalculatorBrain.getSplitAmount()
            destinationVc.totalPeople = splitNumberLabel.text
            destinationVc.tip = tipCalculatorBrain.getSelectedTip()
            
        }
    }
    
}

