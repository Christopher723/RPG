//
//  characterModel.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

import Foundation

struct CharacterModel: Identifiable {
    var id = UUID()
    var name: String = ""
    var race: String
    var power: String
    var stats: [Int]
    
    init(name: String, race: String, power: String, stats: [Int]) {
        self.name = name
        self.race = race
        self.power = power
        self.stats = stats
    }
   
}

struct Abilities: Identifiable {
    var id = UUID()
    var element: String
    var abilities: [String]
    
}





