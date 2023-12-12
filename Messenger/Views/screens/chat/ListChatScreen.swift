//
//  ListChatScreen.swift
//  Messenger
//
//  Created by ad on 05/12/2023.
//

import SwiftUI

struct SearchFriendBox: View {
    @State private var searchText = "";
    var body: some View {
        TextField("Search Friend", text: $searchText).textFieldStyle(BorderedTextFieldStyle()).frame(height: 50)
    }
}

struct ListChatScreen: View {
    @EnvironmentObject private var friendViewModel: FriendViewModal
    @EnvironmentObject private var authViewModel: AuthViewModal
    @EnvironmentObject private var messageViewModal: MessageViewModel
    @Binding var activeScreenTag: SCREEN_NAMES?
    
    func handleOnPress (_ friend: UserModal) {
        activeScreenTag = .CHAT_SCREEN
        
        messageViewModal.setChatInfo(
            participantId: friend.id,
            participantName: friend.fullName ?? "",
            currentUserId: authViewModel.currenctUser?.id ?? "",
            currentUserFullname: authViewModel.currenctUser?.fullName ?? ""
        )
    }
    
    var body: some View {
        NavigationStack {
            SearchFriendBox()
            
            List {
                ForEach(friendViewModel.friends) {
                    friend in
                    HStack {
                        Image("WelcomeAppIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                        
                        
                        VStack (alignment: .leading){
                            Text(friend.email ?? "Unknow")
                                .textStyle(LabelStyle())
                            
                            Text("Me: Oke ne")
                                .textStyle(DescriptionStyle())
                        }
                    }
                    .padding(.vertical, 10)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        handleOnPress(friend)
                    }
                }
            }.scrollContentBackground(.hidden)
            .listStyle(.plain)
            
        
            
        }.onAppear {
            friendViewModel.fetchFriends()
        }
        
    }
}

struct ListChatScreenForPreview: View {
    @State var activeScreenTag: SCREEN_NAMES?
    @StateObject private var friendViewModel = FriendViewModal()
    
    var body: some View {
        ListChatScreen(activeScreenTag: $activeScreenTag)
            .environmentObject(friendViewModel)
//            .onAppear {
//                friendViewModel.addSampleFriends()
//            }
    }
}

#Preview {
    ListChatScreenForPreview()
}
