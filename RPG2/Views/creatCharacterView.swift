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
    @State var power = ""
    @State var stats = [0,0,0]
    @State var characterCount = 0
    @Binding var isPresented: Bool
    
    
    @EnvironmentObject var characters: CharacterViewModel
    
    var body: some View {
        VStack{
            Form{
                TextField("Enter Name", text: $myName)
                TextField("Enter Race", text: $myRace)
                TextField("Enter Power", text: $power)
                Spacer()
                
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
                            if(stats[1] == 0)
                            {
                                for i in 0..<3 {
                                    let newStat = Int.random(in: 5..<20)
                                    self.stats[i] = newStat
                                }
                            }
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
