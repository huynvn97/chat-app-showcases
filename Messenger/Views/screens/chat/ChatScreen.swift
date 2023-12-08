//
//  ChatScreen.swift
//  Messenger
//
//  Created by ad on 06/12/2023.
//

import SwiftUI
            
struct ChatScreen: View {
    @State var input = ""
    @EnvironmentObject private var messageViewModal: MessageViewModel

    var body: some View {
        List {
            ForEach(messageViewModal.messages) {
                message in
                HStack {
                    Text(message.senderName).bold()
                    Text(": ").foregroundColor(.gray)
                    Text(message.content)
                }
            }
        }.onAppear {
            messageViewModal.fetchMessages()
        }
        
        TextField("Enter message", text: $input).textFieldStyle(BorderedTextFieldStyle())
    }
}

//#Preview {
//    ChatScreen()
//}

