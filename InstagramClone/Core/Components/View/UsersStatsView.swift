//
//  UsersStatsView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct UsersStatsView: View {
    var value:Int
    var title:String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
                
        }.frame(width:(UIScreen.main.bounds.width - 130) / 3)
    }
}

struct UsersStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UsersStatsView(value: 0, title: "title")
    }
}
