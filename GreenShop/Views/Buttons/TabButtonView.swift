//
//  TabButton.swift
//  GreenShop
//
//  Created by Роман on 25.07.2023.
//

import SwiftUI

struct TabButtonView: View {
    
    let text: String
    let icon: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(text)
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButtonView(text: "Team", icon: "person.3.fill")
    }
}
