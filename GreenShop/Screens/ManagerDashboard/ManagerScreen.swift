//
//  ManagerScreen.swift
//  GreenShop
//
//  Created by Роман on 24.07.2023.
//

import SwiftUI

struct ManagerScreen: View {
    
    var body: some View {
        
        VStack {
            Text("Dashboard")
                .bold()
                .font(.title)
            
                TabView {
                      AccountScreen(role: "manager")
                        .tabItem {
                            TabButtonView(text: "Account", icon: "person.crop.circle.fill")
                        }
                    TeamScreen()
                        .tabItem {
                            TabButtonView(text: "Team", icon: "person.3.fill")
                        }
                    ActivitiesScreen()
                        .tabItem {
                            TabButtonView(text: "Activities", icon: "sportscourt")
                        }
                    WorldScreen()
                        .tabItem {
                            TabButtonView(text: "World", icon: "globe")
                        }
                   SettingsScreen()
                        .tabItem {
                            TabButtonView(text: "Settings", icon: "gear")
                        }
                }
    
        }
        .transition(.scale)
        
    }
    
}

struct ManagerScreen_Previews: PreviewProvider {
    static var previews: some View {
        ManagerScreen()
    }
}
