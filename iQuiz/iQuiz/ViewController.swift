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
        print("O botão foi pressionado!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    func setupLayout() {
        startQuizButton.layer.cornerRadius = 12.0
    }

}

