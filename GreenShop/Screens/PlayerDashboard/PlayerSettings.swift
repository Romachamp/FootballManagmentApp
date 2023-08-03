//
//  PlayerSettings.swift
//  GreenShop
//
//  Created by Роман on 31.07.2023.
//

import SwiftUI

struct PlayerSettings: View {
    
    @State private var isPlayerOnSelect = true
    
    let DEFAULTS = UserDefaults.standard
    
    var body: some View {
        VStack {
            List {
                Toggle(isOn: $isPlayerOnSelect) {
                    Text("Status:")
                 }
                .onChange(of: isPlayerOnSelect, perform: { newValue in
                    DEFAULTS.set(isPlayerOnSelect, forKey: "IS_PLAYER_ON")
                })
            }
        }
    }
    
}

struct PlayerSettings_Previews: PreviewProvider {
    static var previews: some View {
        PlayerSettings()
    }
}
