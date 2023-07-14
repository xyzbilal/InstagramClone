//
//  File.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct ButtonLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth:.infinity)
            .frame(height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(10)
    }
}
