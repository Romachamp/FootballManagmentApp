//
//  TeamSquadsScreen.swift
//  GreenShop
//
//  Created by Роман on 28.07.2023.
//

import SwiftUI

struct TeamSquadsScreen: View {
    var body: some View {
        VStack {
            Text("Team squads")
            NavigationStack {
                NavigationLink {
                    TeamSquadView(side: true)
                } label: {
                     BasicNavLinkView(text: "Squad 1")
                }
                
                NavigationLink {
                    TeamSquadView(side: false)
                } label: {
                     BasicNavLinkView(text: "Squad 2")
                }
            }
        }
    }
}

struct TeamSquadsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamSquadsScreen()
    }
}
