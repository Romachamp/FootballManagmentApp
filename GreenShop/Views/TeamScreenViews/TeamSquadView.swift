//
//  TeamSquadView.swift
//  GreenShop
//
//  Created by Роман on 28.07.2023.
//

import SwiftUI

struct TeamSquadView: View {
    
    let userDefaults = UserDefaults.standard
    
    let side: Bool
    
    @State var playersArray: [Player] = []
    
    func getPlayers() {
        if let savedData = userDefaults.object(forKey: "TEAM_PLAYERS") as? Data {
            
            do {

                let savedPlayers = try JSONDecoder().decode([Player].self, from: savedData)
                
                playersArray = savedPlayers.split(side)

                print("Success: TeamPlayersScreen, line 24")
                
            } catch {
                print("Error: TeamPlayersScreen, line 27")
            }
            
        }
    }
    
    var body: some View {
        
        VStack {
            Text("Team squad")
            if playersArray.count == 0 {
                Text("We don't have enough players")
                    .padding()
            } else {
                PlayerCardsContainer(players: playersArray)
            }
        }
        .onAppear {
            getPlayers()
        }
        
    }
}

struct TeamSquadView_Previews: PreviewProvider {
    static var previews: some View {
        TeamSquadView(side: true)
    }
}
