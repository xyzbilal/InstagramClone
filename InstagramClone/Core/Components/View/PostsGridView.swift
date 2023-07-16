//
//  PostsGridView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI
import Kingfisher
struct PostsGridView: View {
    private let gridItems:[GridItem] = [
        .init(.flexible(),spacing: 2),
        .init(.flexible(),spacing: 2),
        .init(.flexible(),spacing: 2),
    ]
    
   
    
    @StateObject var viewModel:PostsGridViewModel
    
    init(user:User){
        self._viewModel = StateObject(wrappedValue: PostsGridViewModel(user: user))
    }
    
    let imageDimension:CGFloat = UIScreen.main.bounds.width / 3 - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems,spacing: 2
        ) {
            ForEach(viewModel.posts){ post in
                KFImage(URL(string:post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension,height: imageDimension)
                    .clipped()
            }
            
        }
    }
}

