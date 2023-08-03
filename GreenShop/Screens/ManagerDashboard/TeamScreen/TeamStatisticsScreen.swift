//
//  TeamStatisticsScreen.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import SwiftUI

struct TeamStatisticsScreen: View {
    
    let userDefaults = UserDefaults.standard
    
    @State var properties: [Property] = [
        Property(title: "Mode", value: "0 vs 0"),
        Property(title: "Players", value: "0"),
        Property(title: "Sqauds", value: "2")
    ]
    
    @State private var allPlayers: [Player] = []
    @State private var firstPlayers: [Player] = []
    @State private var secondPlayers: [Player] = []
    
    func getTeamPlayers() {
        if let savedData = userDefaults.object(forKey: "TEAM_PLAYERS") as? Data {
            
            do {

                let savedPlayers = try JSONDecoder().decode([Player].self, from: savedData)
                
                firstPlayers = savedPlayers.split(true)
                secondPlayers = savedPlayers.split(false)

                print("Success: TeamStatisticsScreen, line 41")
                
            } catch {
                print("Error: TeamStatisticsScreen, line 44")
            }
            
        }
    }
    
    func getAllPlayers() {
        if let savedData = userDefaults.object(forKey: "ALL_PLAYERS") as? Data {
            
            do {

                let savedPlayers = try JSONDecoder().decode([Player].self, from: savedData)
                
                allPlayers = savedPlayers

                print("Success: TeamStatisticsScreen, line 57")
                
            } catch {
                print("Error: TeamStatisticsScreen, line 60")
            }
            
        }
    }
    
    var body: some View {
        VStack {
            Text("Your team statistics")
            List(properties) { property in
                HStack {
                    Text("\(property.title):")
                    Text("\(property.value)")
                }
            }
        }.onAppear {
            getTeamPlayers()
            getAllPlayers()
            
            properties[0].value = String(firstPlayers.count) + " vs " + String(secondPlayers.count)
            properties[1].value = String(allPlayers.count)
            
        }
    }
    
}

struct TeamStatisticsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TeamStatisticsScreen()
    }
}
