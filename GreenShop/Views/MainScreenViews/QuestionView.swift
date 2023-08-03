//
//  QuestionView.swift
//  GreenShop
//
//  Created by Роман on 24.07.2023.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var isManager: Bool?
    
    var body: some View {
         VStack {
             
               Text("Who are you?")
                .bold()
                .padding()
                .font(.title2)
             
               HStack {
                Button(action: {
                    isManager = true
                }, label: {
                    BasicButtonView(TEXT: "Manager")
                        .padding()
                })
                Button(action: {
                    isManager = false
                }, label: {
                    BasicButtonView(TEXT: "Player")
                        .padding()
                })
              }
             
         }
        
    }
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView()
//    }
//}
