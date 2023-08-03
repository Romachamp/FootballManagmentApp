//
//  PlayerScreen.swift
//  GreenShop
//
//  Created by Роман on 24.07.2023.
//

import SwiftUI

struct PlayerScreen: View {
    var body: some View {
        VStack {
            Text("Dashboard")
                .bold()
                .font(.title)
            TabView {
                
                AccountScreen(role: "player")
                  .tabItem {
                      TabButtonView(text: "Account", icon: "person.crop.circle.fill")
                  }
                
                WorldScreen()
                    .tabItem {
                        TabButtonView(text: "World", icon: "globe")
                    }
                
               PlayerSettings()
                    .tabItem {
                        TabButtonView(text: "Settings", icon: "gear")
                    }
                
            }
        }
        .transition(.scale)
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScreen()
    }
}
