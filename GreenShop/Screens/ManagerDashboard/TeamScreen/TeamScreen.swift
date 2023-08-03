//
//  TeamScreen.swift
//  GreenShop
//
//  Created by Роман on 26.07.2023.
//

import SwiftUI

struct TeamScreen: View {
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink {
                    TeamPlayersScreen()
                } label: {
                     BasicNavLinkView(text: "Players")
                }
                
                NavigationLink {
                    TeamSquadsScreen()
                } label: {
                     BasicNavLinkView(text: "Squads")
                }
                
                NavigationLink {
                    TeamStatisticsScreen()
                } label: {
                     BasicNavLinkView(text: "Statistics")
                }
                
            }
        }
        
    }
}

//struct TeamScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        TeamScreen()
//    }
//}
