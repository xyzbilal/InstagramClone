//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI
import Combine

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel:RegistrationViewModel

    var body: some View {
        
        
        VStack(spacing:12){
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            Text("You'll use this to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
            TextField("Email", text: $viewModel.email)
                .modifier(TextFieldModifier())
                .keyboardType(.emailAddress)
                .autocorrectionDisabled()
              /*  .onReceive(Just($viewModel.email)) { newValue in
                    let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                    if validString != newValue {
                        viewModel.email = validString
                    }
                }*/
                .padding(.top)
            NavigationLink {
                CreateUserNameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



