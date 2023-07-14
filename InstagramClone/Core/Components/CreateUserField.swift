//
//  CreateUserField.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 11.07.2023.
//

import SwiftUI

struct CreateUserField<Content: View>: View {
    
        var title:String
        var textFieldTitle:String
    
        @Environment(\.dismiss) var dismiss
        @Binding  public var text:String
        
      public let view:Content
        
        var body: some View {
            VStack(spacing:12){
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                Text("You'll use this to sign in to your account")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,24)
                
                TextField("Email", text: $text)
                    .modifier(TextFieldModifier())
                    .padding(.top)
                
         
                NavigationLink {
                    view
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

struct CreateUserField_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
       // CreateUserField(title:"",text: <#T##Binding<String>#>)
    }
}
