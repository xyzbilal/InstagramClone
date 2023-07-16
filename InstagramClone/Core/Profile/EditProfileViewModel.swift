//
//  EditProfileViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel:ObservableObject{
    @Published var user:User
    
    @Published var selectedImage:PhotosPickerItem?{
        didSet{Task {await uploadImage(from: selectedImage)}}
    }
    @Published var profileImage:Image?
    @Published  var fullName = ""
    @Published  var bio = ""
    
    private var uiImage:UIImage?
    
    init(user:User){
        self.user = user
        
        if let fullname = user.fullname{
            self.fullName = fullname
        }
        if let bio = user.bio{
            self.bio = bio
        }
        
    }
    
    func uploadImage(from item:PhotosPickerItem?)async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        var data = [String:Any]()
            
        if let uiImage = uiImage{
            if let url = try? await ImageUploader.uploadImage(uiImage){
                data["profileImage"] = url
            }
        }
        
        // update username if is changed
        if  !fullName.isEmpty && user.fullname != fullName{
            user.fullname = fullName
            data["fullname"] = fullName
        }
        
        // update bio
        
        if  !bio.isEmpty && user.bio != bio{
            user.bio = bio
            data["bio"] = bio
        }
        
        if !data.isEmpty{
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
    }
}
