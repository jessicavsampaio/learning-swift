//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Jessica Sampaio on 25/05/24.
//

import UIKit

extension UIColor {
    static var corDeFundoVerde = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1.0)
    static var corDeFundoVermelho = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1.0)
}

class QuestionViewController: UIViewController {
    var pontuacao = 0
    var numeroQuestao = 0

    @IBOutlet weak var tituloDaQuestao: UILabel!
    @IBOutlet var botoesRespostas: [UIButton]!
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertou = sender.tag == questoes[numeroQuestao].respostaCorreta
        
        if usuarioAcertou {
            sender.backgroundColor = UIColor.corDeFundoVerde
            pontuacao += 1
        } else {
            sender.backgroundColor = UIColor.corDeFundoVermelho
        }
        
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        } else {
            navegaParaTelaDesempenho()
        }
    }
    
    func navegaParaTelaDesempenho() {
        performSegue(withIdentifier: "irParaTelaDesempenho", sender: nil)
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
    
    @objc func configurarQuestao() {
        tituloDaQuestao.text = questoes[numeroQuestao].titulo
        
        for botao in botoesRespostas {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            
            botao.setTitle(tituloBotao, for: .normal)
            
            botao.backgroundColor = UIColor(red: 29/255, green: 82/255, blue: 93/255, alpha: 1.0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let desempenhoVC = segue.destination as? DesempenhoViewController else {return}
        desempenhoVC.pontuacao = pontuacao
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
