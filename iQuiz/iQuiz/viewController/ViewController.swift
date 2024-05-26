//
//  ViewController.swift
//  iQuiz
//
//  Created by Jessica Sampaio on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startQuizButton: UIButton!
    
    @IBAction func touchUpButton() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        navigationItem.hidesBackButton = true
        startQuizButton.layer.cornerRadius = 12.0
    }

}

