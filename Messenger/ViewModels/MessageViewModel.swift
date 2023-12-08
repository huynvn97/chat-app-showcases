//
//  MessageViewModel.swift
//  Messenger
//
//  Created by ad on 07/12/2023.
//

import Foundation
import FirebaseFirestore

class MessageViewModel: ObservableObject {
    var participantId: String?
    var participantName: String?
    var currentUserId: String?
    var currentUserFullname: String?
    
    let collectionRef = Firestore.firestore().collection("messages")
    
    @Published var messages = [Message]()
    @Published var refreshing = false;
    @Published var loading = false;
    @Published var sending = false;
    
    private var listener: ListenerRegistration?
    
    func setChatInfo (participantId: String, participantName: String, currentUserId: String, currentUserFullname: String) {
        self.participantId = participantId
        self.participantName = participantName
        self.currentUserId = currentUserId
        self.currentUserFullname = currentUserFullname
    }
    
    func fetchMessages(completion: @escaping (Error?) -> Void) {
        refreshing = true;
        collectionRef
            .order(by: "createdAt", descending: true)
            .whereField("senderId", in: [currentUserId, participantId])
            .whereField("receiverId", in: [currentUserId, participantId])
            .getDocuments {
                snapshot, error in
                guard let snapshot = snapshot, error == nil else {
                    return
                }
                
                let docs = snapshot.documents
                
                docs.forEach({ doc in
                    let messageData = doc.data()
                    
                    self.messages.append(Message(
                        id: doc.documentID,
                        senderId: messageData["senderId"] as? String ?? "",
                        senderName: "SenderName",
                        receiverId: messageData["receiverId"] as? String ?? "",
                        receiverName: "ReceiverName",
                        content: messageData["content"] as? String ?? "",
                        createdAt: messageData["createdAt"] as? Date ?? Date()
                    ))
                })
                
                completion(error)
            }
    }
    
    func loadMoreMessages () {
        loading = true
    }
    
    func resetMessages () {
        self.messages = []
        self.stopObserving()
    }
    
    func addMessage(content: String, completion: @escaping (Error?) -> Void) {
        if (sending == true) { return }
        
        sending = true
        let data = Dictionary<String, Any>(
            dictionaryLiteral: ("senderId", currentUserId as Any),
                                ("receiverId", participantId as Any),
            ("content", content), ("createdAt", Timestamp(date: Date()))
        )
        
        collectionRef.addDocument(data: data) { error in
            completion(error)
            self.sending = false
        }
    }
    
    func startObserving() {
        if (participantId != nil && currentUserId != nil) {
            listener = collectionRef.addSnapshotListener({ snapshot, error in
                guard let snapshot = snapshot, error == nil else {
                    print("Error listening for collection changes: \(error!)")
                    return
                }
                
                for documentChange in snapshot.documentChanges {
                    switch documentChange.type {
                    case .added:
                        print("Document added with ID: \(documentChange.document.documentID)")
                    case .modified:
                        print("Document modified with ID: \(documentChange.document.documentID)")
                    case .removed:
                        print("Document removed with ID: \(documentChange.document.documentID)")
                    }
                }
            })
        }
    }
    
    func stopObserving() {
        listener?.remove()
    }
}
