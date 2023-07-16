//
//  ImageUploader.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import SwiftUI
import FirebaseStorage

struct ImageUploader{
    static func uploadImage(_ image:UIImage)async throws -> String?{
        guard let imageData = image.jpegData(compressionQuality: 0.5) else{return nil}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        }catch let error{
            print("Upload failed with \(error.localizedDescription)")
            return nil
        }
        
    }
}
