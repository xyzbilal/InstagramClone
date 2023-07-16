//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI
import Kingfisher


struct FeedCell: View {
    var post:Post
    var user = AuthService.shared.currentUser
   // @StateObject var viewModel:FeedCellViewModel
    
    init(post:Post) {
        self.post = post
       // self._viewModel = StateObject(wrappedValue: FeedCellViewModel(postId: post.id))
    }
    
  
    
    
    var body: some View {
        VStack{
            //profile image + name
            HStack{
                if let user = post.user {
                    
                    CircularProfileImageView(user: user,size:.xSmall)
                    
                    Text(user.fullname ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }.padding(.leading,8)
            
            KFImage(URL(string:post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height:400)
                .clipShape(Rectangle())
            //image
            
            // action buttons
            HStack(spacing:16){
                Button {
                    Task{
                        try await PostService.updateLike(post:post)
                    }
                   
                } label: {
                    Image(systemName: post.likedUserIds!.contains(user!.id) ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor( post.likedUserIds!.contains(user!.id) ? .red : .black)
                }
                Button {
               
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()

            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)
            
            // likes
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            
            // caption label
            
            HStack{
                Text("\(post.user?.fullname ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            
            }.font(.footnote)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            
            Text("7h ago")
                .font(.footnote)
                .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
            
            
          /*  VStack(spacing:8){
                ForEach(viewModel.comments){ comment in
                    let user = viewModel.commentUsers[comment.id]
                    HStack{
                        CircularProfileImageView(user: user,size: .xSmall)
                        VStack(alignment:.leading){
                            Text(user?.username ?? "")
                                .font(.caption2)
                                .fontWeight(.semibold)
                            Text(comment.caption)
                                .font(.caption2)
                        }
                       
                        Spacer()
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width:20,height: 20)
                    }.padding(.horizontal)
                }
            }*/
        }
    }
    
    
   /*
    func comments()->some View{
        
    }*/
    
    
}


