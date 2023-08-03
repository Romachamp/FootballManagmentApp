//
//  MatchesScreen.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import SwiftUI

struct Match: Identifiable, Decodable, Encodable {
    var id = UUID()
    
    let date: String
    let firstGoals: Int
    let secondGoals: Int
}

struct MatchesScreen: View {
    
    @State var matches: [Match] = []
    
    var DEFAULTS = UserDefaults.standard
    
    var body: some View {
        VStack {
            
            Text("Last Matches")
            
            if matches.count != 0 {
                ScrollView {
                    ForEach(matches) { match in
                        VStack {
                            MatchView(date: match.date, firstGoals: match.firstGoals, secondGoals: match.secondGoals)
                        }
                        .padding()
                    }
                }
            }
            
            
            NavigationStack {
                NavigationLink {
                    AddMatchScreen()
                } label: {
                    BasicNavLinkView(text: "Add match")
                }
            }

        }.onAppear {
            
            if let savedData = DEFAULTS.object(forKey: "MATCHES") as? Data {

                do {
                    let savedMatches = try JSONDecoder().decode([Match].self, from: savedData)
                    matches = savedMatches
                    print("Success: MatchesScreen, line 54")
                } catch {
                    print("Error: MatchesScreen, line 56")
                }
                
            }
            
        }
        
    }
    
}

struct MatchesScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchesScreen()
    }
}
