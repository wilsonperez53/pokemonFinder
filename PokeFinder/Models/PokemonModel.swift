//
//  PokemonModel.swift
//  PokeFinder
//
//  Created by Estudiantes on 4/12/21.
//

import Foundation

struct pokemon : Codable {
    
    struct Cards:  Identifiable, Codable {
        let id : String
        let name: String
        let images: Images
    }
    
    struct Images:  Codable {
        let small: String
    }
    
    let data: [Cards]
}
