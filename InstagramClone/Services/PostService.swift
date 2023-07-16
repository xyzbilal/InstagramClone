//
//  PostService.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import Foundation
import Firebase

class PostService{
    static private let collections = Firestore.firestore().collection("posts")
    
    static func  fetchPosts() async throws ->[Post]{
       
      
        var posts = [Post]()
        var followedUsers = [User]()
        //
        for id in AuthService.shared.currentUser!.following!{
            let user = try await UserService.fetchUser(withUid: id)
            followedUsers.append(user)
        }
        followedUsers.append( AuthService.shared.currentUser!)
     
        
        for usr in followedUsers{
           
         
            let snapshot = try await collections.whereField("ownerUid", isEqualTo: usr.id).getDocuments()
           
             let psts = try snapshot.documents.compactMap({ postData in
              
                 do{
                     var post:Post  = try postData.data(as: Post.self)
                   
                     post.user = usr
                    if post.likedUserIds == nil{
                        post.likedUserIds = []
                    }
                     return post
                 }catch{
                     print(error)
                 }
                
              return nil
            })
            
            posts.append(contentsOf: psts)
        }
        print(posts.count)
        return posts
    }
    
    
    static func  fetchUserPosts(withUid uid:String) async throws ->[Post]{
        let snapshot = try await collections.whereField("ownerUid", isEqualTo: uid).getDocuments()
        
        let posts = try snapshot.documents.compactMap({try $0.data(as: Post.self)})
        return posts
    }
    
    
    
    static func  updateLike(post:Post) async throws {
        
        let userId = AuthService.shared.currentUser!.id
            
        var post = post
    
        
        if !post.likedUserIds!.contains(userId) || post.likedUserIds!.isEmpty{
            post.likes += 1
            post.likedUserIds!.append(userId)
        }else if post.likedUserIds!.contains(userId){
            post.likes -= 1
             let index = post.likedUserIds!.firstIndex(of: userId)!
            post.likedUserIds!.remove(at:index)
        }
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
         try await Firestore.firestore().collection("posts").document(post.id).updateData(encodedPost)
    }
}
