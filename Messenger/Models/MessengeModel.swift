//
//  MessengerModel.swift
//  Messenger
//
//  Created by ad on 07/12/2023.
//

import Foundation

struct Message: Identifiable {
    let id: String
    let senderId: String
    let senderName: String
    let receiverId: String
    let receiverName: String
    let content: String
    let createdAt: Date
}
