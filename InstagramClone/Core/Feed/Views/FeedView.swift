//
//  FeedVşew.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
      NavigationStack {
            ScrollView{
                LazyVStack(spacing:20) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post:post)
                           
                    }
                }
                .padding(.top,8)
            }
            
            .navigationTitle("Feed")
              .navigationBarTitleDisplayMode(.inline)
              .toolbar {
                  ToolbarItem(placement: .navigationBarLeading) {
                      Image("instagram")
                          .resizable()
                          .frame(width: 100,height: 32)
                  }
                  ToolbarItem(placement: .navigationBarTrailing) {
                      Image(systemName: "paperplane")
                          .imageScale(.large)
                  }
              }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
