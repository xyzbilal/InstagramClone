//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation


class LoginViewModel:ObservableObject{
    @Published  var email:String = ""
    @Published  var password:String = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
