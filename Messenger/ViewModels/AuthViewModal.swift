//
//  AuthViewModal.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthViewModal: ObservableObject {
    let auth = Auth.auth()
    let firestore = Firestore.firestore()
    
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
        
        initUserProfile()
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
                
                strongSelf.initUserProfile()
            } else if let error = error {
                print("Sign-in failed: \(error.localizedDescription)")
            }
        }
        
       
    }
    
    func register() {
        
    }
    
    func logout () async {
        
        do  {
            try await auth.signOut()
            
            isLoggedIn = false
            currenctUser = nil
        } catch {
            
        }
    }
    
    func initUserProfile() {
        let userCollection = firestore.collection("users")
        guard let currentUserId = currenctUser?.id else { return }
        
        let userDocRef = userCollection.document(currentUserId)
        
        userDocRef.getDocument { snapshot, error in
            if let error = error {
                print("Init profile error: \(error.localizedDescription)")
                return
            }
            
            if snapshot != nil { return }
            
            
            userCollection.document(currentUserId).setData([
                "id": currentUserId,
                "email": self.currenctUser?.email ?? "",
                "fullName": self.currenctUser?.fullName ?? ""
            ]) { [weak self] err in
                if let err = err  {
                    print("err init profile: \(err.localizedDescription)")
                }
                else {
                    print("save ok")
                }
            }
            
            
        }
    }
}
