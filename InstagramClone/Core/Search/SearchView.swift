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
                     
                        UserRow(user)
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
                Image(user.profileImage ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                VStack(alignment:.leading) {
                    Text(user.username)
                    .fontWeight(.semibold)
                    if let fullname = user.fullname{
                        Text(fullname)
                    }
                   
                      
                }  .font(.footnote)
                Spacer()
                
            }.padding(.leading,8)
        }
        .foregroundColor(.black)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
