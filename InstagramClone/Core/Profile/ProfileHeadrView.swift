//
//  ProfileHeadrView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI

struct ProfileHeadrView: View {
    @State private var showEditProfile:Bool = false
    var user:User
    var body: some View {
        VStack(spacing:10){
            imageAndStats()
            nameAndBio()
            editProfileButton()
        }.padding(.horizontal)
            .fullScreenCover(isPresented:  $showEditProfile) {
                Text("BLBLALALDSALFSD")
            }
    }
    

    
    @ViewBuilder
    fileprivate func imageAndStats() -> some View {
     
 
                HStack{
                    Image(user.profileImage ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height:80)
                        .padding(.all,3)
                        .overlay(RoundedRectangle(cornerRadius: 43)
                            .stroke(Color.gray,lineWidth:1)
                        )
                        .clipShape(Circle())
                    Spacer()
                    HStack{
                        UsersStatsView(value: 10, title: "Posts")
                        UsersStatsView(value: 50, title: "Followers")
                        UsersStatsView(value: 45, title: "Following")
                    }
                }
            
         //   }
    
        .padding(.bottom)
    }
    
    
    @ViewBuilder
    fileprivate func nameAndBio() -> some View {
         // name and bio
        VStack(alignment: .leading,spacing: 4){
            Text(user.fullname ?? user.username)
                .font(.footnote)
                .fontWeight(.semibold)
            Text(user.bio ?? "")
                .font(.footnote)
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding(.horizontal)
    }
    
    @ViewBuilder
    fileprivate func editProfileButton() -> Button<some View> {
     
        Button {
            if user.isCurrentUser{
                showEditProfile.toggle()
            }else{
                
            }
        } label: {
            Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(height: 32)
                .frame(maxWidth:.infinity)
                .background(user.isCurrentUser ? .white : Color(.systemBlue))
                .foregroundColor(user.isCurrentUser ? .black : .white)
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(user.isCurrentUser ? .gray : .blue,lineWidth:1)
                )
                .padding(.horizontal)
        }
    }
    
  
    
    
}

