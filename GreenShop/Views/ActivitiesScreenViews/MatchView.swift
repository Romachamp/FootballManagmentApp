//
//  MatchView.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import SwiftUI

struct MatchView: View {
    
    let date: String
    let firstGoals: Int
    let secondGoals: Int
    
    var body: some View {
        
        VStack {
            
            Text("\(String(firstGoals)) - \(String(secondGoals))")
                .padding(4)
                .font(.title2)
                .bold()
            
            switch (firstGoals, secondGoals) {
                case let (f, s) where f > s:
                    Text("Squad 1 Win")
                case let (f, s) where f < s:
                    Text("Squad 2 Win")
                default:
                    Text("Draw")
            }
            
            Text(date)
                .padding(4)
                .foregroundColor(.gray)
                .italic()
            
        }
        .padding()
        .background(
            Rectangle()
            .fill(Color.white)
            .cornerRadius(12)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 5,
                x: 0,
                y: 0
            )
        )
        
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(date: "2022.05.29", firstGoals: 3, secondGoals: 2)
    }
}
