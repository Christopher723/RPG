//
//  characterViewModel.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

import Foundation
import SwiftUI

let rarityWeights: [String: Double] = [
        "Fire": 1.0,       // Common
        "Water": 1.0,      // Common
        "Earth": 1.0,      // Common
        "Air": 1.0,        // Common
        "Metal": 0.7,      // Uncommon
        "Sand": 0.7,       // Uncommon
        "Lava": 0.7,       // Uncommon
        "Lightning": 0.7,  // Uncommon
        "Blood": 0.7,      // Uncommon
        "Sound": 0.7,      // Uncommon
        "Crystal": 0.5,    // Rare
        "Summoning": 0.5,  // Rare
        "Plasma": 0.5,     // Rare
        "Explosion": 0.5,  // Rare
        "Astral": 0.4,     // Super Rare
        "Light": 0.4,      // Super Rare
        "Dark": 0.4,       // Super Rare
        "Gravity": 0.4,    // Super Rare
        "Time": 0.2,       // Ultra Rare
        "Space": 0.2       // Ultra Rare
    ]


class CharacterViewModel: ObservableObject {
    
    @Published var allCharacters: [CharacterModel] = []
    
    func addCharacter(Name: String, Race: String, Power: String, Stats: [Int] ){
        allCharacters.append(CharacterModel(name: Name, race: Race, power: Power, stats: Stats))
    }
    
    
    func getPower() -> String{
        let totalWeight = rarityWeights.values.reduce(0.0, +)
            let randomValue = Double.random(in: 0.0...totalWeight)

            var cumulativeWeight = 0.0
            for (power, weight) in rarityWeights {
                cumulativeWeight += weight
                if randomValue <= cumulativeWeight {
                    return power
                }
            }
        return "none"
            
    }
    
        
    func getColor(inputPower power: String) -> Color{
        if let rarity = rarityWeights[power] {
                if rarity == 1.0 {
                    return .gray
                } else if rarity == 0.7 {
                    return .green
                } else if rarity == 0.5 {
                    return .blue
                } else if rarity == 0.4 {
                    return .red
                } else if rarity == 0.2 {
                    return .purple
                }
            }
        return .black
    }
    
    func generateStats() -> [Int]{
        var stats = [0,0,0]
        for i in 0..<3 {
            let newStat = Int.random(in: 5..<20)
            stats[i] = newStat
            
        }
        return stats
    }

    
}


