//
//  characterView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

import SwiftUI


struct characterView: View {
    
    var name = "Christopher"
    var race = "Human"
    var power = "Fire"
    var stats = [0,0,0]
    
    @EnvironmentObject var characters: CharacterViewModel
    
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text("\(name)")
                    .bold()
                Text("Race: \(race)")
                HStack{
                    Text("Power: ")
                    Text("\(power)").foregroundStyle(characters.getColor(inputPower: power))
                        .font(.system(size:19))
                        .bold()
                }
                    
                    
            }
            
            Spacer()
            HStack(spacing:20){
                    VStack{
                        Text("STR")
                        Text("\(stats[0])")
                    }
                    VStack{
                        Text("MAG")
                        Text("\(stats[1])")
                    }
                    
                    VStack{
                        Text("SPD")
                        Text("\(stats[2])")
                    }
                }
            
            
            
        }
        
    }
    
}

#Preview {
    characterView()
}


