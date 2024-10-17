//
//  ResultsViewController.swift
//  FinanceCalculator
//
//  Created by Jessica Sampaio on 16/10/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amountInvested: Double?
    var interestRate: Double?
    var interestFrequency: String?
    var periodInvested: Double?
    var result: Double?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var InfoLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(format: "%.2f", result ?? 0)
        InfoLabel.text = "This is what you will have after investing \(amountInvested ?? 0) dollars for \(periodInvested ?? 1) months with an interest of \(interestRate ?? 0)% \(interestFrequency ?? "Monthly") interest rate."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
