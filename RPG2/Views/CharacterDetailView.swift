//
//  CharacterDetailView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/20/23.
//

//
//  AbilityDetailView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/19/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @Binding var name: String
    @Binding var stats: [Int]
    @Binding var isShowingChar: Bool
    
    var body: some View {
        
        VStack{
            HStack{
                Text(name)
                    .padding(25)
                    .bold()
                    Spacer()
                
            }
            Spacer()
            HStack(spacing: 30){
                
                VStack(){
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
            .padding(40)
            
        }
        .frame(width: 300, height: 485)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowingChar.toggle()
        }label:{
            XDismissButton()
        }, alignment: .topTrailing)

        
    }
        
}

#Preview {
    CharacterDetailView(name: .constant("testName"), stats: .constant( [0,0,0]), isShowingChar: .constant(false))
}
