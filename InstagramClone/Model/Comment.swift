//
//  Comments.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 16.07.2023.
//

import Foundation

struct Comment:Identifiable,Codable,Hashable{
    let id:String
    let ownerUid:String
    let caption:String
    let postId:String
    var user:User?
}

extension Comment{
    static var MOCK_COMMENTS :[Comment] =  [
        .init(id: NSUUID().uuidString, ownerUid: "IxgHhd3r7mhyuSnItlfpcCBVS893", caption: "Looks Beatiful",postId: "APt2osUhJa2g9JjXNFjP"),
        .init(id: NSUUID().uuidString, ownerUid: "WLFXIg8mK6Srf3CRHLAuIERdidf2", caption: "What Camera you used",postId: "APt2osUhJa2g9JjXNFjP"),
        .init(id: NSUUID().uuidString, ownerUid: "WLFXIg8mK6Srf3CRHLAuIERdidf2", caption: "nice",postId: "dyMU83ue6ZwqobTfVSRp"),
    ]
}
