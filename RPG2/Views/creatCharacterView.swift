//
//  creatCharacterView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/15/23.
//

//
//  createCharacter.swift
//  RPG
//
//  Created by Christopher Woods on 10/13/23.
//

import SwiftUI

struct createCharacter: View {
    @State var myName = ""
    @State var myRace = ""
    @State var power = "none"
    @State var stats = [0,0,0]
    @State var characterCount = 0
    @Binding var isPresented: Bool
    
    
    @EnvironmentObject var characters: CharacterViewModel
    
    var body: some View {
        VStack{
            Form{
                TextField("Enter Name", text: $myName)
                TextField("Enter Race", text: $myRace)
                HStack{
                    HStack{
                    Text("Power: ")
                    Text("\(power)")
                            .foregroundStyle(isPresented ? characters.getColor(inputPower: power) : .black)
                            .font(.system(size:20))
                            .bold()
                    }
                    Spacer()
                    Circle()
                        .frame(width: 20)
                        .onTapGesture {
                            power = characters.getPower()
                        }
                }
                
                VStack(alignment: .leading)
                {
                    rarityIcon(rarity: "Common", rarityColor: .gray)
                    rarityIcon(rarity: "Unommon", rarityColor: .green)
                    rarityIcon(rarity: "Rare", rarityColor: .blue)
                    rarityIcon(rarity: "Super Rare", rarityColor: .red)
                    rarityIcon(rarity: "Ultra Rare", rarityColor: .purple)
                    
                    
                }
                HStack(spacing: 30){
                    VStack(){
                        Text("STR")
                        Text("\(stats[0])")
                    }
                    
                    
                    
                    Divider()
                    VStack{
                        Text("MAG")
                        Text("\(stats[1])")
                    }
                    Divider()
                    VStack{
                        Text("SPD")
                        Text("\(stats[2])")
                    }
                    
                    Divider()
                    Circle()
                        .frame(height: 30)
                        .padding(0)
                        .onTapGesture{
                            stats = characters.generateState()
                        }
                }
                
                
                Section{
                    Button(action: {
                        characters.addCharacter(Name: myName, Race: myRace, Power: power, Stats: stats )
                        
                        isPresented.toggle()
                        
                    },label: {
                        HStack {
                            Spacer()
                            Text("Finish")
                            Spacer()
                        }
                    }).disabled(myName == "")
                    
                }
                
            }
            
            
            
            
        }
           
        
        
    }
}

#Preview {
    createCharacter(isPresented: .constant(false))
}

struct rarityIcon: View {
    var rarity: String
    var rarityColor: Color
    var body: some View {
        HStack{
            Circle()
                .frame(width: 18)
                .foregroundStyle(rarityColor)
            Text(" - \(rarity)")
                .foregroundStyle(rarityColor)
        }
    }
}
