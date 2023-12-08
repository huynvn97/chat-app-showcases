//
//  ChatScreen.swift
//  Messenger
//
//  Created by ad on 06/12/2023.
//

import SwiftUI
            
struct ChatScreen: View {
    @State var input = ""
    @EnvironmentObject var authViewModel: AuthViewModal
    
    @StateObject var messageViewModal = MessageViewModel(
        participantId: "",
        participantName: "",
        currentUserId: self.authViewModel.currenctUser?.id ?? "",
        currentUserFullname: self.authViewModel.currenctUser?.fullName ?? ""
    )

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
        }
        TextField("Enter message", text: $input).textFieldStyle(BorderedTextFieldStyle())
    }
}

//#Preview {
//    ChatScreen()
//}

