//
//  AbilityDetailView.swift
//  RPG2
//
//  Created by Christopher Woods on 10/19/23.
//

import SwiftUI

struct AbilityDetailView: View {
    
    @Binding var image: String
    @Binding var description: String
    @Binding var isShowing: Bool
    var body: some View {
        
        VStack{
            Spacer().frame(height: 30)
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 200, height: 200)
                    
                
            }
            .padding()
            Text(description)
                .padding()
            
            Spacer()
        }
        .frame(width: 300, height: 405)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button{
            isShowing = false
        }label:{
            XDismissButton()
        }, alignment: .topTrailing)

        
    }
        
}

#Preview {
    AbilityDetailView(image: .constant(""), description: .constant(""), isShowing: .constant(false))
}
