//
//  User.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import Foundation
import Firebase
struct User:Identifiable,Codable,Hashable{
    let id:String
    var username:String
    var profileImage:String?
    var fullname:String?
    var bio:String?
    let email:String
    var followers:[String]?
    var following:[String]?
    
    var isCurrentUser:Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
                return currentUid == id
    }
    
    var isFollowedUser:Bool{
        return AuthService.shared.currentUser?.following?.contains(id) ?? false
    }
    
}

extension User{
    static var MOCK_USERS:[User] = [
        .init(id: NSUUID().uuidString, username: "einstein1986", profileImage: nil,fullname: "Albert Einstein",bio:"I found it", email: "einstein@gmail.com",following: []),
        .init(id: NSUUID().uuidString, username: "tesla.nikolai", profileImage: nil,fullname: "Nikolai Tesla", bio:"Edison is thief", email: "tesla@gmail.com",following: []),
        .init(id: NSUUID().uuidString, username: "thomas_edison", profileImage: nil,fullname: "Thomas Edison",bio:"AC is evil", email: "edison@gmail.com",following: []),
        .init(id: NSUUID().uuidString, username: "newton", profileImage: nil,fullname: "Isaac Newton ",bio:"Gravityyyyy", email: "newton@gmail.com",following: []),
    ]
}
