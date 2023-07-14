//
//  UploadPostView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI
import PhotosUI
struct UploadPostView: View {
    @State private var caption:String = ""
    @State private var selectPhoto:Bool = false
    @StateObject  var viewModel = UploadPostViewModal()
    @Binding var tabIndex:Int
    var body: some View {
        VStack{
            HStack{
                Button {
                    caption = ""
                    viewModel.selectedImage = nil
                    viewModel.postImage = nil
                    tabIndex = 0
                    
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                } label: {
                    Text("Upload")
                }

            }.padding(.horizontal)
            HStack(spacing:9){
                
                if let image = viewModel.postImage {
                 image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                 
                TextField("Enter your caption ...", text: $caption,axis: .vertical)
            }
            Spacer()
        }
        .onAppear{
            selectPhoto.toggle()
        }
        .photosPicker(isPresented: $selectPhoto,selection: $viewModel.selectedImage)
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
