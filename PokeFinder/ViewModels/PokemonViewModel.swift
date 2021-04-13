//
//  PokemonViewModel.swift
//  PokeFinder
//
//  Created by Estudiantes on 4/12/21.
//

import Foundation

class PokemonViewModel: ObservableObject {
        @Published var pokemonCards: [pokemon.Cards] = []
    
    func fetchCards(name: String){
        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards?q=name:\(name)") else {
            print("API Error")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let response = try? JSONDecoder().decode(pokemon.self, from: data) {
                    DispatchQueue.main.async {
                        self.pokemonCards = response.data
                    }
                    return
                }
            }
            
        }.resume()
    }
}
