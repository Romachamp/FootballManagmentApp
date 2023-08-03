//
//  BasicButtonView.swift
//  GreenShop
//
//  Created by Роман on 24.07.2023.
//

import SwiftUI

struct BasicButtonView: View {
    
    let TEXT: String
    
    var body: some View {
        Text(TEXT)
            .foregroundColor(.black)
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
    }
}

struct BasicButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BasicButtonView(TEXT: "Yes")
    }
}
