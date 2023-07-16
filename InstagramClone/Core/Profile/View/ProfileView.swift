//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct ProfileView: View {
   var user:User

    var posts:[Post]{
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
   
    var body: some View {
       // NavigationStack {
            ScrollView{
                VStack(spacing:10){
                 ProfileHeadrView(user: user)
                    Divider()
                    
                    PostsGridView(user:user)
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                            
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }

                }
            }
       // }
    }
    
    
    
    
    
    
  
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user:User.MOCK_USERS[2])
    }
}
