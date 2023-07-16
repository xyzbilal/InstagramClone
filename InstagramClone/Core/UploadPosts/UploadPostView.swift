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
                    clearPostDataAndReturnToFeed()
                    
                } label: {
                    Text("Cancel")
                        .font(.subheadline)
                }
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    
                    Task {
                        try? await viewModel.uploadpost(caption:caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }

            }.padding(.horizontal)
            
            HStack(spacing:9){
                
                if let image = viewModel.postImage {
                 image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }else{
                    
                       
                            RoundedRectangle(cornerRadius: 2)
                        .stroke(Color(.systemGray4).opacity(0.5),lineWidth: 2)
                                .background(Color(.systemGray4).opacity(0.5))
                                .frame(width: 100, height: 100)
                             
                                .overlay{
                                    Image(systemName: "plus")
                                        
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                        }
                                .onTapGesture {
                                    selectPhoto.toggle()
                                }
                    
                }
                 
                TextField("Enter your caption ...", text: $caption,axis: .vertical)
            }.padding()
            Spacer()
        }
        .onAppear{
            selectPhoto.toggle()
        }
        .photosPicker(isPresented: $selectPhoto,selection: $viewModel.selectedImage)
    }
    
    private func clearPostDataAndReturnToFeed(){
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
