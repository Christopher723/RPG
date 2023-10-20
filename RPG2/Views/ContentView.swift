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
            }
            
            
            
                
                
                
                Spacer()
            
        }
        .padding()
        .sheet(isPresented: $isPresented, content: {
            createCharacter(isPresented: $isPresented)
                .environmentObject(characters)
                .environmentObject(ability)
        })
    }
}

#Preview {
    ContentView()
}
