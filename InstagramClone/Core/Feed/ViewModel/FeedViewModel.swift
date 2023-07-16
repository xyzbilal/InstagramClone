//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import Foundation
import Firebase
class FeedViewModel:ObservableObject{
    @Published var posts = [Post]()
  
    
    init() {
        print("OVA HERE")
        Task{
            try await fetchPosts()
        }
    }
    
    @MainActor
    func fetchPosts() async throws{
         self.posts = try await PostService.fetchPosts()
    }
    
   
}
