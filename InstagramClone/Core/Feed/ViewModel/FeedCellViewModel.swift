//
//  FeedCellViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 16.07.2023.
//

import Foundation

class FeedCellViewModel:ObservableObject{
    @Published var comments = [Comment]()
    @Published var commentUsers = [String:User]()
    init(postId:String){
        Task{
            try? await fetchComments(postId: postId)
        }
        
    }
 @MainActor
    func fetchComments(postId:String) async throws {
        
       let users  =  try await UserService.fetchAllUsers()
        
        self.comments = Comment.MOCK_COMMENTS.compactMap({ comment in
            if comment.postId == postId {
                return comment
            }
            return nil
        })
        
        for comment in self.comments{
            commentUsers[comment.id] = users.first(where: {
                return  $0.id == comment.ownerUid
               
            })
        }
    }
}
