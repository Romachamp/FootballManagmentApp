//
//  LeaguesService.swift
//  GreenShop
//
//  Created by Роман on 30.07.2023.
//

import Foundation

struct Result: Codable {
    let result: [League]
}

struct League: Identifiable, Codable {
    let id = UUID()
    
    let league_name: String
    let country_name: String
    let league_logo: String?
}

enum LeaguesError: Error {
    case invalidURL
    case requestFailed(Error)
}

class LeaguesService {
    func getLeagues() async throws -> Result {
        
        let urlString = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=84750796013336dbad8a4dd41ee9142be486126f79ce52801e7bdc0e452f3f6c"
        
        guard let url = URL(string: urlString) else {
            throw LeaguesError.invalidURL
        }
        
        var request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(Result.self, from: data)
        } catch {
            throw LeaguesError.requestFailed(error)
        }
        
    }
}
