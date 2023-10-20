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
    @State var isExpanded = false
    @State var abilityNumber = 0
    
    
    @EnvironmentObject var characters: CharacterViewModel
    @EnvironmentObject var ability: abilityViewModel
    
    var body: some View {
        ZStack{

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
                                abilityNumber = characters.findRarityIndex(for: power)!
                                
                            }
                    }
                    
                    VStack(alignment: .leading)
                    {
                        HStack(){
                            Spacer()
                            Text("Power Rarities")
                            
                                .onTapGesture {
                                    
                                    isExpanded.toggle()
                                }
                            
                            Image(systemName: "chevron.down")
                            Spacer()
                        }
                        if isExpanded {
                            rarityIcon(rarity: "Common", rarityColor: .gray)
                            rarityIcon(rarity: "Unommon", rarityColor: .green)
                            rarityIcon(rarity: "Rare", rarityColor: .blue)
                            rarityIcon(rarity: "Super Rare", rarityColor: .red)
                            rarityIcon(rarity: "Ultra Rare", rarityColor: .purple)
                        }
                        
                        
                    }
                    VStack{
                        
                        
                        
                        HStack{
                            AbilityView(abilityPosition: abilityNumber, power: power
                            ).environmentObject(ability)
                            
                        }
                        
                        
                        
                    }.frame(height:100)
                    
                    
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
                                stats = characters.generateStats()
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
                
                
            }.blur(radius: ability.isShowing ? 20 : 0)
            if ability.isShowing{
                AbilityDetailView(image: .constant(ability.currentAbility),description: .constant(ability.currentDescription), isShowing: $ability.isShowing)
                
            }
            
        }
        
        
        }
           
        
        
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


