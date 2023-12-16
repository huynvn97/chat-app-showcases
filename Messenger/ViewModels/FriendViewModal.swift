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
        self.friends = [UserModal]()
        firestore.collection("users").getDocuments { 
            [weak self] snapshot, error in
            if let error = error {
                print("fetchFriends error: \(error.localizedDescription)")
            } else {
                snapshot?.documents.forEach({
                    documentSnapshot in
                    let userData = documentSnapshot.data()
                    print("user data", userData)
                    
                    guard let userId = userData["id"] as? String else { return }
                    
                    print("thí step")
                    
                    var user = UserModal(id: userId)
                    
                    user.email = userData["email"] as? String ?? nil
                    user.fullName = userData["fullName"] as? String ?? nil
                    
                    self!.friends.append(user)
                    print(user)
                })
            }
        }
    }
    
    func addSampleFriends () {
        friends.append(UserModal(id: "user-id-1", fullName: "Jackson Nguyen", email: "jackson@gmail.com"))
        friends.append(UserModal(id: "user-id-2", fullName: "Falcon Nguyen", email: "Falcon@gmail.com"))
        friends.append(UserModal(id: "user-id-3", fullName: "Adam Nguyen", email: "adam@gmail.com"))
    }
    
    func getFriendNameById(friendId: String) -> String? {
        guard let foundFriend = self.friends.first(where: { fr in
            fr.id == friendId
        }) else {
            return nil
        }
        
        return foundFriend.fullName
    }
}
