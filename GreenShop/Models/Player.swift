//
//  TitleValuePair.swift
//  GreenShop
//
//  Created by Роман on 29.07.2023.
//

import Foundation

struct Player: Identifiable, Encodable, Decodable {
    
     let id = UUID()
    
     var username: String
     var email: String?
     var isAvailibale: Bool
    
}
