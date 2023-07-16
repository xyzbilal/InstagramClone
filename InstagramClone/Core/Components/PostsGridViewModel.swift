//
//  PostsGridViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import Foundation

class PostsGridViewModel:ObservableObject{
    private let user:User
    @Published var posts = [Post]()
    init(user:User) {
        self.user = user
        Task{
            try await fetchUserPosts()
        }
    }
    
    @MainActor
    func fetchUserPosts() async throws{
        self.posts =  try await PostService.fetchUserPosts(withUid: user.id)
        for i in 0..<self.posts.count{
            
            self.posts[i].user = user
        }
    }
}
