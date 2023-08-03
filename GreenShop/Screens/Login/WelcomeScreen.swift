//
//  WelcomeScreen.swift
//  GreenShop
//
//  Created by Роман on 22.07.2023.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @State private var isSignedIn: Bool = false
    @State var userEmail: String = ""
    
    let DEFAULTS = UserDefaults.standard
    
    var body: some View {
        VStack {
            if isSignedIn {
                MainScreen()
            } else {
                if !userEmail.isEmpty {
                    MainScreen()
                } else {
                    Text("Welcome to GreenShop!")
                        .bold()
                        .font(.title)
                    SignInView(isSignedIn: $isSignedIn)
                }
            }
        }
        .onAppear {
            userEmail = DEFAULTS.string(forKey: "USER_EMAIL") ?? ""
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
