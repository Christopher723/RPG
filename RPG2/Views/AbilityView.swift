//
//  AbilityView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/17/23.
//

import SwiftUI

struct AbilityView: View {
    
    var abilityPosition = 0
    
    @EnvironmentObject var ability: abilityViewModel

    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(Array(ability.abilities[abilityPosition].abilities), id: \.key) { (key, value) in
                    Image(key)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                        .onTapGesture {
                            ability.currentAbility = key
                            ability.currentDescription = value
                            ability.isShowing = true
                        }
                    
                }
            }
        }
        
        
    }
    
}

