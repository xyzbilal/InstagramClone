//
//  LoginView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220,height: 100)
                VStack{
                    TextField("Enter your email",text:$viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Enter your password",text:$viewModel.password)
                        .font(.subheadline)
                        .modifier(TextFieldModifier())
                    
                }
                
                Button {
                   
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .padding(.top)
                        .padding(.trailing,24)
                    
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
              
                //Login
                Button {
                    Task{
              try await viewModel.login()
                       /* for user in  User.MOCK_USERS{
                            try? await AuthService.shared.createUser(email: user.email, password: "123456", username: user.username)
                        }*/
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity)
                        .frame(height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                    
                }
                .padding(.vertical)
                .padding(.horizontal,24)
                
                HStack{
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                        .foregroundColor(.gray)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(width:UIScreen.main.bounds.width / 2 - 40, height: 0.5)
                        .foregroundColor(.gray)
                    
                }
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .scaledToFill()
                        .frame(width:20,height:20)
                        .clipShape(Circle())
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top,8)
                Spacer()
                Divider()
                
                NavigationLink{
                   AddEmailView()
                    
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account ?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical,16)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
