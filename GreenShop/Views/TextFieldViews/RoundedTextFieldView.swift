//
//  RoundedTextFieldView.swift
//  GreenShop
//
//  Created by Роман on 30.07.2023.
//

import Foundation
import SwiftUI

struct RoundedTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
            .padding()
    }
}

extension View {
    func roundedTextFieldStyle() -> some View {
        self.modifier(RoundedTextFieldStyle())
    }
}
