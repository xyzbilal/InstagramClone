//
//  CreateUserNameView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct CreateUserNameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel:RegistrationViewModel
    var body: some View {
        
        VStack(spacing:12){
            Text("Create Username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            TextField("Username", text: $viewModel.username)
                .modifier(TextFieldModifier())
                .padding(.top)
            
            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .modifier(ButtonLabelModifier())
                
                
            }
            .padding(.vertical)
            .padding(.horizontal,24)
            Spacer()
        }
        .toolbar {
            ToolbarItem (placement:.navigationBarLeading){
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

