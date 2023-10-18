//
//  abilityViewModel.swift
//  RPG2
//
//  Created by Christopher Woods on 10/17/23.
//

import Foundation


class abilityViewModel: ObservableObject{
    
    @Published var abilities: [Abilities] = [
        Abilities(element: "Fire", abilities: ["Fireball", "Firetornado", "SunExplosion"], description: ["Throw a Fireball", "Create tornado of fire", "Explode the sun"]),
        Abilities(element: "Water", abilities: ["Waterblast", "Whirlpool", "Greatflood"], description: ["Throw a Fireball", "Create tornado of fire", "Explode the sun"])
    ]
    
    
}
