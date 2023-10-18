//
//  AbilityView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/17/23.
//

import SwiftUI

struct AbilityView: View {
    
    var abilityPosition = 0
    @ObservedObject var ability: abilityViewModel
    
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(ability.abilities[abilityPosition].abilities, id:  \.self){
                    index in
                    Image(index)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding()
                    
                }
            }
        }
    }
}

#Preview {
    AbilityView(ability: abilityViewModel())
}
