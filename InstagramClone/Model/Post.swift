//
//  Post.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
struct Post:Identifiable,Codable,Hashable{
    let id:String
    let ownerUid:String
    let caption:String
    var likes:Int
    let imageUrl:String
    let timeStamp:Date
    var user:User?
}

extension Post{
    static var MOCK_POSTS:[Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Camping is Awesome", likes: 150, imageUrl: "Picture1", timeStamp: Date(),user: User.MOCK_USERS[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "What a beautiful place", likes: 30, imageUrl: "Picture2", timeStamp: Date(),user: User.MOCK_USERS[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Who is the artist", likes: 25, imageUrl: "Picture3", timeStamp: Date(),user: User.MOCK_USERS[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "This lake is awesome", likes: 45, imageUrl: "Picture7", timeStamp: Date(),user: User.MOCK_USERS[3]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "Natures Beautiy", likes: 45, imageUrl: "Picture6", timeStamp: Date(),user: User.MOCK_USERS[3]),
       
    ]
}
