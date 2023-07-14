//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct FeedCell: View {
    var post:Post
    var body: some View {
        VStack{
            //profile image + name
            HStack{
                if let user = post.user {
                    
                    Image(user.profileImage ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                    
                    Text(user.fullname ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Spacer()
                }
            }.padding(.leading,8)
            
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height:400)
                .clipShape(Rectangle())
            //image
            
            // action buttons
            HStack(spacing:16){
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
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
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post:Post.MOCK_POSTS.first!)
    }
}
