//
//  ChatScreen.swift
//  Messenger
//
//  Created by ad on 06/12/2023.
//

import SwiftUI

struct MessageInput: View {
    @Binding var input: String;
    @EnvironmentObject private var messageViewModal: MessageViewModel
    @EnvironmentObject private var authViewModel: AuthViewModal
    
    var body: some View {
        HStack {
            TextField("Enter message", text: $input).textFieldStyle(BorderedTextFieldStyle()).disabled(messageViewModal.sending)
            Button("Send") {
                if (authViewModel.currenctUser?.id) != nil {
                    messageViewModal.addMessage(content: input) { err in
                        if (err == nil) {
                            self.input = ""
                        }
                    }
                }
            }.disabled(messageViewModal.sending)
        }
    }
}
            
struct ChatScreen: View {
    @State var input = ""
    @EnvironmentObject private var messageViewModal: MessageViewModel
    @EnvironmentObject private var authViewModel: AuthViewModal
    @EnvironmentObject private var friendViewModel: FriendViewModal
    
    var body: some View {
        List {
            ForEach(messageViewModal.messages) {
                msg in
                HStack {
                    Text(friendViewModel.getFriendNameById(friendId: msg.senderId) ?? "Unknow").bold()
                    Text(": ").foregroundColor(.gray)
                    Text(msg.content)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .onAppear {
            messageViewModal.startObserving()
        }
        .onDisappear {
            messageViewModal.resetMessages()
        }
        
        MessageInput(input: $input)
    }
}

//#Preview {
//    ChatScreen()
//}

