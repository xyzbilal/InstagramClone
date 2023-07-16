//
//  SearchView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing:12){
                    ForEach(viewModel.users) { user in
                        if user.id != AuthService.shared.currentUser!.id{
                            UserRow(user)
                        }else{
                            EmptyView()
                        }
                       
                    }
                }
                .searchable(text: $searchText,prompt: "Search")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user:user)
            })
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    func UserRow(_ user:User)->some View{
        
        NavigationLink(value:user) {
            //profile image + name
            HStack{
                CircularProfileImageView(user:user,size:.small)
               
                VStack(alignment:.leading) {
                    Text(user.username)
                    .fontWeight(.semibold)
                    if let fullname = user.fullname{
                        Text(fullname)
                    }
                   
                      
                }  .font(.footnote)
                Spacer()
                
               Button {
                    Task{
                        try await UserService.followOrUnfollowUser(withUid:user.id)
                    }
                } label: {
                    Text(user.isFollowedUser ? "Unfollow" :
                            
                            "Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(height: 32)
                        .frame(maxWidth:80)
                        .background(user.isFollowedUser ? .white : Color(.systemBlue))
                        .foregroundColor(user.isFollowedUser ? .black : .white)
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isFollowedUser ? .gray : .blue,lineWidth:1)
                        )
                }

                
            }.padding(.horizontal,8)
        }
        .foregroundColor(.black)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
