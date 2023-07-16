//
//  CircularProfileImageView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 15.07.2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize{
    case xSmall
    case small
    case medium
    case large
    var dimension:CGFloat{
        switch self {
        case .xSmall:
            return 40
        case .small:
            return 48
        case .medium:
            return 64
        case .large:
            return 80
        }
    }
}


struct CircularProfileImageView: View {
    let user:User?
    
    var size:ProfileImageSize = .large
    var image:Image?
    var body: some View {
        
      
        
        if let user = user, let profileImage = user.profileImage{
            KFImage(URL(string:profileImage))
                .resizable()
                .modifier(CircularImageModifier(size:size.dimension))
               
        }else if let image = image{
            image
                .resizable()
                .modifier(CircularImageModifier(size:size.dimension))
        }else{
            Image(systemName: "person.circle.fill")
                .resizable()
                .modifier(CircularImageModifier(size:size.dimension))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user:User.MOCK_USERS[0])
    }
}
