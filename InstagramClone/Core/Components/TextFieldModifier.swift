//
//  TexttFieldModifier.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
}


