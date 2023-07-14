//
//  SearchViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
@MainActor
class SearchViewModel:ObservableObject{
    
    @Published var users = [User]()
    
    init() {
        Task{
            try await fetchAllUsers()
        }
    }
    
    func fetchAllUsers() async throws{
       let users = try await UserService.fetchAllUsers()
        self.users = users
    }
}
