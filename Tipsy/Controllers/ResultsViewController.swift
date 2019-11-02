//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Kyle Wiltshire on 11/1/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var splitAmount: String?
    var totalPeople: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = splitAmount;
        settingLabel.text = "Split between \(totalPeople!), with \(tip!) tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
