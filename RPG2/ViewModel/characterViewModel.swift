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
    
    
    
    
    
    
    let rarityWeights: [String: Double] = [
        "Fire": 1.004,       // Common
        "Water": 1.003,      // Common
//        "Earth": 1.002,      // Common
//        "Air": 1.001,        // Common
//        "Metal": 0.702,      // Uncommon
//        "Sand": 0.701,       // Uncommon
//        "Lava": 0.7001,       // Uncommon
//        "Lightning": 0.70001,  // Uncommon
//        "Blood": 0.7000001,      // Uncommon
//        "Sound": 0.70000001,      // Uncommon
//        "Crystal": 0.54,    // Rare
//        "Summoning": 0.53,  // Rare
//        "Plasma": 0.52,     // Rare
//        "Explosion": 0.51,  // Rare
//        "Astral": 0.43,     // Super Rare
//        "Light": 0.42,      // Super Rare
//        "Dark": 0.41,       // Super Rare
//        "Gravity": 0.4,    // Super Rare
//        "Time": 0.21,       // Ultra Rare
//        "Space": 0.2       // Ultra Rare

            
            
        ]

    
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

    func findRarityIndex(for element: String) -> Int? {
        
        let sortedElements = rarityWeights.keys.sorted { rarityWeights[$0]! > rarityWeights[$1]! }
           if let index = sortedElements.firstIndex(of: element) {
               return index
           } else {
               return nil
           }
       }
        
        
}


