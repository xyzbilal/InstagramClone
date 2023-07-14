//
//  ContentView.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 10.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModal()
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                     .environmentObject(registrationViewModel)
               
            }else if let currentUser = viewModel.currentUSer{
                MainTabView(user:currentUser)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
