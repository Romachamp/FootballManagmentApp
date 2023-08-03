//
//  SettingsScreen.swift
//  GreenShop
//
//  Created by Роман on 26.07.2023.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var isTeamPlayersOn: Bool = true
    
    let DEFAULTS = UserDefaults.standard
    
    var body: some View {
        
        VStack {
           Text("Settings")
            List {
                HStack {
                    Toggle(isOn: $isTeamPlayersOn) {
                        VStack {
                            Text("Team players")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(5)
                                Text("Team players visibility in Team > Players")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("", size: 14))
                        }
                    }
                    .onChange(of: isTeamPlayersOn) { value in
                        DEFAULTS.setValue(isTeamPlayersOn, forKey: "IS_TEAM_PLAYERS_ON")
                    }
                }
           }
        }
        
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
