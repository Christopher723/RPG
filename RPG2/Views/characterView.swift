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
    
    
    var body: some View {
        HStack{
            VStack{
                Text("\(name)")
                    .bold()
                Text("Race: \(race)")
                Text("Power: \(power)")
            }
            
            HStack{
                Text("STR")
                Text("\(stats[0])")
                Text("MAG")
                Text("\(stats[1])")
                Text("SPD")
                Text("\(stats[2])")
            }
            .padding()
        }
        
    }
    
}

#Preview {
    characterView()
}


