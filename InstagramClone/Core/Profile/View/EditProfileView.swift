//
//  EditProfileView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
 
 
    @StateObject var viewModel:EditProfileViewModel
    init(user:User){
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
     var body: some View {
        VStack{
            // toolbar
            HStack{
                Button {
                        dismiss()
                } label: {
                      Text("Cancel")
                        .font(.footnote)
                }
                Spacer()
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    Task{
                        try? await viewModel.updateUserData()
                        dismiss()
                    }
                    
                } label: {
                      Text("Done")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                
            }.padding()
              
            Divider()
            
            // profile photo
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    CircularProfileImageView(user: viewModel.user,image: viewModel.profileImage)
                    
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                   

            }
            .padding(.vertical,8)
            Divider()
            
            // profile info
            EditProfileRow(title:"Name",placeHolder: "Enter your name",text: $viewModel.fullName)
            EditProfileRow(title:"Bio",placeHolder:  "Enter your bio",text: $viewModel.bio)
            Spacer()
        }
    }
}


struct EditProfileRow:View{
    let title:String
    let placeHolder:String
    @Binding var text:String
    var body: some View {
        HStack{
            Text(title)
                .padding(.leading,8)
                .frame(width:100,alignment: .leading)
            VStack{
                TextField(placeHolder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 39)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user:User.MOCK_USERS[0])
    }
}
