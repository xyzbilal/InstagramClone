//
//  UsersService.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
import Firebase

class UserService{
    
    private static var users = [User]()
    
    private static let collection = Firestore.firestore().collection("users")
    
    static func fetchUser(withUid uid:String)async throws ->User{
        
        let snapshot = try await collection.document(uid).getDocument()
        return  try snapshot.data(as:User.self)
    }
   
    static func fetchAllUsers()async throws ->[User]{
        if !users.isEmpty{
            return users
        }
        
        let snapshot = try await collection.getDocuments()
        users =  snapshot.documents.compactMap({try? $0.data(as: User.self)})
        
        return users
    }
    
    @MainActor
    static func followOrUnfollowUser(withUid id:String) async throws {
      
        var following = AuthService.shared.currentUser?.following
        if following == nil{
            following = []
        }
        
        if !following!.isEmpty && following!.contains(id) {
            following!.remove(at: following!.firstIndex(of: id)!)
        }else{
            following!.append(id)
        }
       
        AuthService.shared.currentUser?.following = following
        guard let encodedData = try? Firestore.Encoder().encode(AuthService.shared.currentUser!) else { return }
        
        try await collection.document(AuthService.shared.currentUser!.id).updateData(encodedData)
    }
}
