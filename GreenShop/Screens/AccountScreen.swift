//
//  HomeScreen.swift
//  GreenShop
//
//  Created by Роман on 25.07.2023.
//

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    
    let title: String
    let value: String
}

struct AccountScreen: View {
    
    @State var userEmail: String = ""
    let role: String
    
    let DEFAULTS = UserDefaults.standard
    var cards: [Card] {
        return [
            Card(title: "Username", value: userEmail.replacingOccurrences(of: "@gmail.com", with: "")),
            Card(title: "Email", value: userEmail),
            Card(title: "Role", value: role)
       ]
    }
    
    var body: some View {
        NavigationStack {
            Text("Your account")
                .font(.title3)
            List(cards) { card in
                HStack {
                    Text("\(card.title):")
                    Text("\(card.value)")
                        .bold()
                }
            }
        }
        .onAppear {
            userEmail = DEFAULTS.string(forKey: "USER_EMAIL") ?? ""
            if userEmail.isEmpty {
                userEmail = "user@gmail.com"
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        AccountScreen(role: "role")
    }
}
