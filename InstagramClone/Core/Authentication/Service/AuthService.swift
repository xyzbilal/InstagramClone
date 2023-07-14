//
//  AuthService.swift
//  InstagramClone
//
//  Created by Bilal SIMSEK on 14.07.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase


class AuthService{
    static let shared = AuthService()
    
    @Published var userSession:FirebaseAuth.User?
    @Published var currentUser:User?
   
    init() {
      
        Task{
            try? await loadUserData()
        }
    }
    @MainActor
    func login(withEmail email:String, password:String) async throws{
        do{
            print("OVA HERE")
            let result  = try await Auth.auth().signIn(withEmail: email, password: password)
         
           self.userSession = result.user
            
            try await loadUserData()
        } catch let error{
            print("DEBUG : User login failed with error of \( error.localizedDescription)")
        }
    }
    @MainActor
    func createUser(email:String, password:String, username:String) async throws{
        do{
           let result = try await Auth.auth().createUser(withEmail: email, password: password)
           
                self.userSession = result.user
         
             await uploadUserData(uid: result.user.uid, email: email, username: username)
        }catch let error{
            print("DEBUG : User registration failed with error of \( error.localizedDescription)")
        }
    }
    
    @MainActor
    func loadUserData() async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else {return}
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try? snapshot.data(as:User.self)
    }
    
    func signout(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    @MainActor
    func uploadUserData(uid:String, email:String, username:String) async {
       
      let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
    
}
