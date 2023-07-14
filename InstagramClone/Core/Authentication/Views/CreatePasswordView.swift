//
//  CreatePasswordView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel:RegistrationViewModel
    var body: some View {
        
        VStack(spacing:12){
            Text("Create Password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("Pasword must be at least 6 character")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            SecureField("Password", text: $viewModel.password)
                .modifier(TextFieldModifier())
                .padding(.top)
            NavigationLink {
                CompleteSignUpView()
                    .navigationBarBackButtonHidden()
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


