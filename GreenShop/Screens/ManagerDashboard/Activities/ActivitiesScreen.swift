//
//  MatchesScreen.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import SwiftUI

struct ActivitiesScreen: View {
    var body: some View {
        
        VStack {
            
            NavigationStack {
                
                NavigationLink {
                    MatchesScreen()
                } label: {
                    BasicNavLinkView(text: "Matches")
                }
                
                NavigationLink {
                    TrainingScreen()
                } label: {
                    BasicNavLinkView(text: "Training")
                }
                
            }
            
        }
        
    }
}

struct ActivitiesScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesScreen()
    }
}
