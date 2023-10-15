//
//  characterViewModel.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

import Foundation
import SwiftUI



class CharacterViewModel: ObservableObject {
    
    @Published var allCharacters: [CharacterModel] = []
    
    func addCharacter(Name: String, Race: String, Power: String, Stats: [Int] ){
        allCharacters.append(CharacterModel(name: Name, race: Race, power: Power, stats: Stats))
    }

    
}


