//
//  ViewController.swift
//  FinanceCalculator
//
//  Created by Jessica Sampaio on 16/10/24.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var investedTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var periodNumberLabel: UILabel!
    @IBOutlet weak var monthlyButton: UIButton!
    @IBOutlet weak var yearlyButton: UIButton!
    
    var amountInvested = 0.00
    var monthlyInterestRate = 5.0
    var interestFrequency = "Monthly"
    var result = 0.00
    var periodInvested = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interestRateTextField.text = String(format: "%.0f", monthlyInterestRate)
        interestRateTextField.addTarget(self, action: #selector(interestRateChanged), for: .editingChanged)
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        periodNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func interestFrequencyChanged(_ sender: UIButton) {
        monthlyButton.isSelected = false
        yearlyButton.isSelected = false
        sender.isSelected = true
        
        if sender.titleLabel?.text == "Yearly" {
            interestFrequency = "Yearly"
            
            let annualInterestRate = Double(interestRateTextField.text!) ?? 0.0
            monthlyInterestRate = (pow(1 + annualInterestRate / 100, 1 / 12) - 1) * 100
        } else {
            interestFrequency = "Monthly"
            monthlyInterestRate = Double(interestRateTextField.text!) ?? 0.0
        }
    }
    
    @objc func interestRateChanged() {
        if interestFrequency == "Yearly" {
            let annualInterestRate = Double(interestRateTextField.text!) ?? 0.0
            monthlyInterestRate = (pow(1 + annualInterestRate / 100, 1 / 12) - 1) * 100
        } else {
            monthlyInterestRate = Double(interestRateTextField.text!) ?? 0.0
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let principal = Double(investedTextField.text!) ?? 0.0
        let rate = monthlyInterestRate / 100
        periodInvested = Double(periodNumberLabel.text ?? "0.0") ?? 0.0
        
        result = principal * pow(1 + rate, periodInvested)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountInvested = Double(investedTextField.text!)
            destinationVC.interestFrequency = interestFrequency
            destinationVC.interestRate = Double(interestRateTextField.text!)
            destinationVC.periodInvested = periodInvested
            destinationVC.result = result
        }
    }
}

