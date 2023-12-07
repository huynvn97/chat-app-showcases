//
//  FriendViewModal.swift
//  Messenger
//
//  Created by ad on 06/12/2023.
//

import Foundation
import FirebaseFirestore

class FriendViewModal: ObservableObject {
    let firestore = Firestore.firestore()
    
    @Published var friends = [UserModal]()
    
    func fetchFriends () {
        firestore.collection("users").getDocuments { snapshot, error in
            if let error = error {
                print("fetchFriends error: \(error.localizedDescription)")
            } else {
                snapshot?.documents.forEach({ documentSnapshot in
                    let userData = documentSnapshot.data()
                    print("user data", userData)
                    
                    if let userId = userData["id"] as? String {
                        var user = UserModal(id: userId)
                        if let email = userData["email"] as? String {
                            user.email = email
                        }
                        if let fullName = userData["fullName"] as? String {
                            user.fullName = fullName
                        }
                        
                        self.friends = [UserModal]()
                        self.friends.append(user)
                    }
                })
            }
        }
    }
    
    
}
