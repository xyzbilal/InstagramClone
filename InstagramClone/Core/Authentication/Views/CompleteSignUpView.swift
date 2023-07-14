//
//  CompleteSignUpView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel:RegistrationViewModel
    var body: some View {
        
        VStack(spacing:12){
            Spacer()
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("Click below to complete signup.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal,24)
            
          
            
            Button {
                Task{try await viewModel.createUser()}
            } label: {
                Text("Complete Signup")
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

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
