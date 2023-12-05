//
//  AuthViewModal.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import Foundation
import FirebaseAuth

class AuthViewModal: ObservableObject {
    let auth = Auth.auth()
    @Published var currenctUser: UserModal? = nil
    @Published var isLoggedIn = false
    
    func checkAuth () {
        
        guard let authUser = auth.currentUser else { return }
    
        isLoggedIn = true
        currenctUser = UserModal(id: authUser.uid)
  
        if let email = authUser.email {
            currenctUser?.email = email
        }
        if let fullName = authUser.displayName {
            currenctUser?.fullName = fullName
        }
    }
    
    func login(username: String, password: String) {
        auth.signIn(withEmail: username, password: password) {
            [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if let authResult = authResult {
                strongSelf.isLoggedIn = true
                strongSelf.currenctUser = UserModal(id: authResult.user.uid)
              
                if let email = authResult.user.email {
                    strongSelf.currenctUser?.email = email
                }
                if let fullName = authResult.user.displayName {
                    strongSelf.currenctUser?.fullName = fullName
                }
                
            } else if let error = error {
                print("Sign-in failed: \(error.localizedDescription)")
            }
        }
    }
    
    func register() {
        
    }
    
    func logout () {
        isLoggedIn = false
        currenctUser = nil
    }
}
