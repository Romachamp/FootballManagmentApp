//
//  BasicNavLinkView.swift
//  GreenShop
//
//  Created by Роман on 28.07.2023.
//

import SwiftUI

struct BasicNavLinkView: View {
    
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundColor(.black)
            Image(systemName: "arrow.right")
                .foregroundColor(.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(
            Rectangle()
            .fill(Color.white)
            .cornerRadius(12)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 5,
                x: 0,
                y: 0
            )
        )
        .padding()
    }
}

struct BasicNavLinkView_Previews: PreviewProvider {
    static var previews: some View {
        BasicNavLinkView(text: "Link")
    }
}
