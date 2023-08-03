//
//  SignInButtonView.swift
//  GreenShop
//
//  Created by Роман on 22.07.2023.
//

import SwiftUI

struct SignInButtonView: View {
    
    let companyName: String
    let companyIcon: String
    
    var body: some View {
        HStack {
            Image("\(companyIcon)")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Sign in with \(companyName)")
                .foregroundColor(.black)
        }
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

struct SignInButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SignInButtonView(companyName: "Google", companyIcon: "GoogleLogo")
    }
}
