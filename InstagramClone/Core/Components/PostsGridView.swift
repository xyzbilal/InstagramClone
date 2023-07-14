//
//  PostsGridView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI

struct PostsGridView: View {
    private let gridItems:[GridItem] = [
        .init(.flexible(),spacing: 2),
        .init(.flexible(),spacing: 2),
        .init(.flexible(),spacing: 2),
    ]
    var posts:[Post]
    
    let imageDimension:CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems,spacing: 2
        ) {
            ForEach(posts){ post in
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension,height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

