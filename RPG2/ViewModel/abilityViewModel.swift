//
//  abilityViewModel.swift
//  RPG2
//
//  Created by Christopher Woods on 10/17/23.
//

import Foundation


class abilityViewModel: ObservableObject{
    
    @Published var isShowing = false

    @Published var currentAbility = ""
    @Published var currentDescription = ""
    @Published var isShowingChar = false
    @Published var index = 0
    
    
    
    
    @Published var abilities: [Abilities] = [
        Abilities(element: "Fire", abilities : [
            "Fireball" : "Throw a Fireball",
            "Firetornado" : "Create tornado of fire",
            "SunExplosion" : "Explode the sun"]),
        Abilities(element: "Water", abilities: [
            "Waterblast" : "Throw a Waterblast",
            "Whirlpool" : "Suck your opponent into a whirlpool",
            "Greatflood" : "Flood the world" ])
                  
//
//        Abilities(element: "Earth", abilities: ["Earthblast", "Rockslide", "Earthquake"], description: ["Throw a Rock", "Create tornado of fire", "Explode the sun"]),
//        Abilities(element: "Air", abilities: ["Fly", "Aircutter", "Tornado"], description: ["Throw a Rock", "Create tornado of fire", "Explode the sun"]),
//        
    
    ]
    
}
