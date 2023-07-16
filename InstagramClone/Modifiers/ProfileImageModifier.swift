//
//  ProfileImageModifier.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import SwiftUI

struct CircularImageModifier: ViewModifier {
    let size:CGFloat
    init(size:CGFloat = 80){
        self.size = size
    }
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width:size,height: size)
            .overlay(RoundedRectangle(cornerRadius: size / 2)
                .stroke(Color(.systemGray4),lineWidth:1)
            )
            .clipShape(Circle())
            .foregroundColor(Color(.systemGray4))
        
    }
}
