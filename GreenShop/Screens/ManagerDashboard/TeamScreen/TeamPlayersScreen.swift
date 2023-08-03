//
//  TeamScreen.swift
//  GreenShop
//
//  Created by Роман on 25.07.2023.
//

import SwiftUI

struct TeamPlayersScreen: View {
    
    let DEFAULTS = UserDefaults.standard
    
    var allPlayers: [Player] = [
        Player(username: "dima", email: "dima@gmail.com", isAvailibale: false),
        Player(username: "anton", email: "anton@gmail.com", isAvailibale: true),
        Player(username: "john", email: "john@gmail.com", isAvailibale: false),
        Player(username: "roman", email: "roman@gmail.com", isAvailibale: true)
    ]
    
    @State var teamPlayers: [Player] = []
    @State var isTeamPlayersOn: Bool = true

    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack {
                    Text("All players")
                    ScrollView {
                        PlayerCardsContainer(players: allPlayers)
                    }
                }
                
                if isTeamPlayersOn {
                    VStack {
                        Text("Team players")
                        ScrollView {
                            PlayerCardsContainer(players: teamPlayers)
                        }
                    }
                }
                
                
            }
            
            
        }.onAppear {
            
            if DEFAULTS.bool(forKey: "IS_TEAM_PLAYERS_ON") == true || DEFAULTS.bool(forKey: "IS_TEAM_PLAYERS_ON") == false  {
                isTeamPlayersOn = DEFAULTS.bool(forKey: "IS_TEAM_PLAYERS_ON")
            }
            
           teamPlayers = allPlayers.filter { player in
                player.isAvailibale == true
            }
            
            do {
                let encodedAllPlayersData = try JSONEncoder().encode(allPlayers)
                let encodedTeamPlayersData = try JSONEncoder().encode(teamPlayers)
                
                DEFAULTS.set(encodedAllPlayersData, forKey: "ALL_PLAYERS")
                DEFAULTS.set(encodedTeamPlayersData, forKey: "TEAM_PLAYERS")
                
                print("Success: TeamPlayersScreen, line 70")
            } catch {
               print("Error: TeamPlayersScreen, line 68")
            }
            
        }
    
    }
    
}

struct TeamScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamPlayersScreen()
    }
}
