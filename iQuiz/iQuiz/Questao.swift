//
//  Questao.swift
//  iQuiz
//
//  Created by Jessica Sampaio on 25/05/24.
//

import Foundation

struct Questao {
    var titulo: String
    var respostas: [String]
    var respostaCorreta: Int
}

let questoes: [Questao] = [
    Questao(titulo: "Qual a IDE usada para programar em Swift?", respostas: ["VScode", "Xcode", "Intellij"], respostaCorreta: 1),
    Questao(titulo: "Qual é um framework de Swift?", respostas: ["UIKit", "React", "Flask"], respostaCorreta: 0),
    Questao(titulo: "Como declarar uma constante em Swift?", respostas: ["const", "var", "let"], respostaCorreta: 2),
    Questao(titulo: "Swift é utilizado para programar para qual destes OS?", respostas: ["Windows", "Linux", "IOS"], respostaCorreta: 1),
    Questao(titulo: "Como declarar uma variável em Swift?", respostas: ["var", "let", "int"], respostaCorreta: 0),
    Questao(titulo: "Como usar string interpolation em Swift?", respostas: ["\\(var)", "$(var)", "/(var)"], respostaCorreta: 0),
    Questao(titulo: "Qual o tipo do dado: var name = (first: 'Taylor', last: 'Swift')?", respostas: ["Dictionary", "Tuple", "Array"], respostaCorreta: 1),
    Questao(titulo: "Como é chamada uma função que pertence a um objeto em Swift?", respostas: ["Property", "Function", "Method"], respostaCorreta: 1),
    Questao(titulo: "Como gerar um número inteiro randômico de 1 a 100 em Swift?", respostas: ["Int.random(1...100)", "random(in: 1...100)", "Int.random(in: 1...100)"], respostaCorreta: 2)
]
