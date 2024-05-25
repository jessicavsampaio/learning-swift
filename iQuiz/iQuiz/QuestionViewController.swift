//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Jessica Sampaio on 25/05/24.
//

import UIKit

class QuestionViewController: UIViewController {
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloDaQuestao: UILabel!
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        if sender.tag == questoes[numeroQuestao].respostaCorreta {
            print("Resposta correta")
            sender.backgroundColor = UIColor(red: 0/255, green: 250/255, blue: 0/255, alpha: 155/255)
            pontuacao += 1
        } else {
            print("Resposta incorreta")
        }
        
        numeroQuestao += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configurarQuestao()
    }
    
    func setupLayout() {
        navigationItem.hidesBackButton = true
        tituloDaQuestao.numberOfLines = 0
        tituloDaQuestao.textAlignment = .center
        
        for botao in botoesRespostas {
            botao.layer.cornerRadius = 12.0
        }
    }
    
    func configurarQuestao() {
        tituloDaQuestao.text = questoes[numeroQuestao].titulo
        
        for botao in botoesRespostas {
            botao.
        }
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
