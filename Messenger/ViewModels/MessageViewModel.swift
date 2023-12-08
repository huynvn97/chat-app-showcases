//
//  MessageViewModel.swift
//  Messenger
//
//  Created by ad on 07/12/2023.
//

import Foundation
import FirebaseFirestore

class MessageViewModel: ObservableObject {
    var participantId: String
    var participantName: String
    var currentUserId: String
    var currentUserFullname: String
    let firestore = Firestore.firestore()
    
    @Published var messages = [Message]()
    @Published var refreshing = false;
    @Published var loading = false;
    
    init (participantId: String, participantName: String, currentUserId: String, currentUserFullname: String) {
        self.participantId = participantId
        self.participantName = participantName
        self.currentUserId = currentUserId
        self.currentUserFullname = currentUserFullname
    }
    
    func fetchMessages () {
        refreshing = true;
        firestore
            .collection("messages")
            .whereField("senderId", in: [currentUserId, participantId])
            .whereField("receiverId", in: [currentUserId, participantId])
            .getDocuments {
                snapshot, error in
                if let error = error {
                    return
                }
                let docs = snapshot?.documents
                
                docs?.forEach({ doc in
                    let messageData = doc.data()
                    
                    self.messages.append(Message(
                        id: messageData["id"] as? String ?? "",
                        senderId: messageData["senderId"] as? String ?? "",
                        senderName: currentUserFullname,
                        receiverId: messageData["receiverId"] as? String ?? "",
                        receiverName: self.currentUserFullname,
                        content: messageData["content"] as? String ?? ""
                    ))
                })
               
            }
    }
    
    func loadMoreMessages () {
        loading = true
    }
    
    func resetMessages () {
        
    }
    
}
