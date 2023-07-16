//
//  UploadPostViewModal.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModal:ObservableObject{
    
    @Published var selectedImage:PhotosPickerItem?{
        didSet{Task {await uploadImage(from: selectedImage)}}
    }
    @Published var postImage:Image?
    
    private var uiImage:UIImage?
    
    func uploadImage(from item:PhotosPickerItem?)async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadpost(caption:String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let uiImage = uiImage else {return}
        guard let imageUrl = try await ImageUploader.uploadImage(uiImage) else {return}
        let postRef = Firestore.firestore().collection("posts").document()
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageUrl, timeStamp: Timestamp(),likedUserIds: [])
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else {return}
        try await  postRef.setData(encodedPost)
                
    }
}
