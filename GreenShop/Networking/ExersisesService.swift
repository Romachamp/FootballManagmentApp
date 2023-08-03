//
//  ExersisesService.swift
//  GreenShop
//
//  Created by Роман on 30.07.2023.
//

import Foundation

struct Post: Identifiable, Codable {
    let id = UUID()
    
    let name: String
    let muscle: String
    let difficulty: String
    let instructions: String
}

enum ExersisesError: Error {
    case invalidURL
    case requestFailed(Error)
}

class ExersiesService {
    func getExersises(_ muscle: String) async throws -> [Post] {
        let urlString = "https://api.api-ninjas.com/v1/exercises?muscle=\(muscle)"
        
        guard let url = URL(string: urlString) else {
            throw ExersisesError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.setValue("5XVneyxy9YVQ7/wAd6Mkpw==F70jTJkTKe6I19CT", forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode([Post].self, from: data)
        } catch {
            throw ExersisesError.requestFailed(error)
        }
    }
}

