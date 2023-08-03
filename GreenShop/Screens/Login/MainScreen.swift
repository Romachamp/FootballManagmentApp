//
//  MainScreen.swift
//  GreenShop
//
//  Created by Роман on 22.07.2023.
//

import SwiftUI

struct MainScreen: View {
    
    @State var userEmail: String = ""
    @State var isManager: Bool? = nil
    @State private var isScreenVisible: Bool = false
    
    let DEFAULTS = UserDefaults.standard
    
    func endQuestion() {
        let nonOptionalIsManager = isManager ?? false
        DEFAULTS.setValue(nonOptionalIsManager, forKey: "IS_MANAGER")
    }
    
    var body: some View {
        
        VStack {
            
            if isManager == nil {
                Text("\(userEmail.isEmpty ? "user@gmail.com" : userEmail)")
                QuestionView(isManager: $isManager)
            } else {
                let boolIsManager = Bool(isManager ?? false)
                if boolIsManager == false {
                    PlayerScreen()
                        .onAppear {
                            withAnimation {
                                isScreenVisible = true
                            }
                        }
                } else {
                    ManagerScreen()
                        .onAppear {
                            withAnimation {
                                isScreenVisible = true
                            }
                        }
                }
            }
            
        }
        .onAppear {
            userEmail = DEFAULTS.string(forKey: "USER_EMAIL") ?? ""
        }
        
    }
    
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
