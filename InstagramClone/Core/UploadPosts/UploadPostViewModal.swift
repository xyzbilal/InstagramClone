//
//  UploadPostViewModal.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI
import PhotosUI

@MainActor
class UploadPostViewModal:ObservableObject{
    @Published var selectedImage:PhotosPickerItem?{
        didSet{Task {await uploadImage(from: selectedImage)}}
    }
    @Published var postImage:Image?
    
    func uploadImage(from item:PhotosPickerItem?)async{
        guard let item = item else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else {return}
        self.postImage = Image(uiImage: uiImage)
    }
}
