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
    
    
    var isCurrentUser:Bool{
        guard let currentUid = Auth.auth().currentUser?.uid else {return false}
                return currentUid == id
    }
    
    
}

extension User{
    static var MOCK_USERS:[User] = [
        .init(id: NSUUID().uuidString, username: "einstein1986", profileImage: "einstein",fullname: "Albert Einstein",bio:"I found it", email: "einstein@gmail.com"),
        .init(id: NSUUID().uuidString, username: "tesla.nikolai", profileImage: "tesla",fullname: "Nikolai Tesla", bio:"Edison is thief", email: "tesla@gmail.com"),
        .init(id: NSUUID().uuidString, username: "thomas_edison", profileImage: "edison",fullname: "Thomas Edison",bio:"AC is evil", email: "edison@gmail.com"),
        .init(id: NSUUID().uuidString, username: "newton", profileImage: "newton",fullname: "Isaac Newton ",bio:"Gravityyyyy", email: "newton@gmail.com"),
    ]
}
