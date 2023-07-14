//
//  ContentViewModal.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
import FirebaseAuth
import Combine


class ContentViewModal:ObservableObject{
    private var service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUSer:User?
    
    init(){
        setupSubscribers()
     
    }
    
    func setupSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)

        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUSer = currentUser
        }.store(in: &cancellables)

    }
}
