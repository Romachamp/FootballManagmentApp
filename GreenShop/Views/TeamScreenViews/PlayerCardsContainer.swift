//
//  PlayerCardsContainer.swift
//  GreenShop
//
//  Created by Роман on 26.07.2023.
//

import SwiftUI

struct PlayerCardsContainer: View {
    
    let players: [Player]
    
    var body: some View {
        VStack {
            ForEach(players) { player in
                VStack {
                    
                    VStack {
                        Text(player.username)
                        Text(player.email ?? "")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                    
                    if player.isAvailibale {
                        HStack {
                            Text("status:")
                            Circle()
                                .fill(.green)
                                .frame(width: 15, height: 15)
                        }
                    } else {
                        HStack {
                            Text("status:")
                            Circle()
                                .fill(.red)
                                .frame(width: 15, height: 15)
                        }
                    }
                    
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
                .padding()
            }
        }
        .frame(width: 180)
    }
}

//struct PlayerCardsContainer_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerCardsContainer()
//    }
//}
