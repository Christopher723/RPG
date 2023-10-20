//
//  ContentView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var isPresented = false
    @StateObject var characters = CharacterViewModel()
    @StateObject var ability = abilityViewModel()
    
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Spacer()
                    Circle()
                        .frame(width: 50)
                        .onTapGesture {
                            isPresented.toggle()
                        }
                    
                    
                    
                }
                
                
                
                
                ForEach(characters.allCharacters.indices, id:  \.self){
                    index in
                    let character = characters.allCharacters[index]
                    characterView(name: character.name, race: character.race, power: character.power, stats: character.stats)
                        .environmentObject(characters)
                        .padding()
                        .onTapGesture{
                            ability.index = index
                            ability.isShowingChar = true
                            ability.power = characters.allCharacters[index].power
                        }
                }
                
                
                
                
                
                
                Spacer()
                
                
            }.blur(radius: ability.isShowingChar ? 20 : 0)
                .padding()
                .sheet(isPresented: $isPresented, content: {
                    createCharacter(isPresented: $isPresented)
                        .environmentObject(characters)
                        .environmentObject(ability)
                })
            if ability.isShowingChar {
                CharacterDetailView(
                    name: .constant(characters.allCharacters[ability.index].name),
                    stats: .constant(characters.allCharacters[ability.index].stats), isShowingChar: $ability.isShowingChar)
                
                
                
                
                
            }
            
        }
        
        
    }
}

#Preview {
    ContentView()
}
