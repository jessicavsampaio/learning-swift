//
//  Movie.swift
//  Cinetopia
//
//  Created by Jessica Sampaio on 11/06/24.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rating: Double
    let releaseDate: String
}

let movies: [Movie] = [
    Movie(id: 1, title: "Avatar", image: "Avatar", synopsis: "No exuberante mundo alienígena de Pandora vivem os Na'vi, seres que parecem ser primitivos, mas são altamente evoluídos. Como o ambiente do planeta é tóxico, foram criados os avatares, corpos biológicos controlados pela mente humana que se movimentam livremente em Pandora. Jake Sully, um ex-fuzileiro naval paralítico, volta a andar através de um avatar e se apaixona por uma Na'vi. Esta paixão leva Jake a lutar pela sobrevivência de Pandora.", rating: 9.4, releaseDate: "18/12/2009"),
    Movie(id: 2, title: "Vingatores: Ultimato", image: "Vingadores", synopsis: "Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.", rating: 9.2, releaseDate: "25/04/2019"),
    Movie(id: 3, title: "Titanic", image: "Titanic", synopsis: "Um artista pobre e uma jovem rica se conhecem e se apaixonam na fatídica viagem inaugural do Titanic em 1912. Embora esteja noiva do arrogante herdeiro de uma siderúrgica, a jovem desafia sua família e amigos em busca do verdadeiro amor.", rating: 8.0, releaseDate: "16/01/1998"),
    Movie(id: 4, title: "Avatar: O caminho da água", image: "Avatar-caminho", synopsis: "Após formar uma família, Jake Sully e Ney'tiri fazem de tudo para ficarem juntos. No entanto, eles devem sair de casa e explorar as regiões de Pandora quando uma antiga ameaça ressurge, e Jake deve travar uma guerra difícil contra os humanos.", rating: 9.1, releaseDate: "15/12/2022")
]



