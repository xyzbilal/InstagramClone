//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user:User
    var body: some View {
        NavigationStack {
             ScrollView{
                 VStack(spacing:10){
                     ProfileHeadrView(user: user)
                     
                     Divider()
                     
                     
                     PostsGridView(posts: Post.MOCK_POSTS)
                     
                    
               
                     
                 }
             }
             .navigationTitle("Profile")
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button {
                         AuthService.shared.signout()
                     } label: {
                         Image(systemName: "line.3.horizontal")
                             .foregroundColor(.black)
                     }

                 }
             }
         }
    }
    
  
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user:User.MOCK_USERS[0])
    }
}
