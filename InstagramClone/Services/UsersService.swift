//
//  UsersService.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
import Firebase
class UserService{
    
   
    static func fetchAllUsers()async throws ->[User]{
      
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as: User.self)})
    }
}
