//
//  ViewController.swift
//  FirstViewCodeProject
//
//  Created by Jessica Sampaio on 27/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var myView: View = {
        let view = View()
        view.delegate = self
        
        return view
    }()
    
    override func loadView() {
        super.loadView()
        
        self.view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.setup(labelText: "Olá, mundo!", buttonTitle: "Testar")
    }
}

extension ViewController: ViewDelegate {
    func didTapButton() {
        myView.setup(labelText: "Sucesso!", buttonTitle: "Testar novamente")
    }
}

