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
    
    var body: some View {
        NavigationStack {
            List {
                SearchFriendBox()
                
                ForEach(friendViewModel.friends) {
                    friend in
                    NavigationLink {
                        ChatScreen().navigationTitle(friend.fullName ?? friend.email ?? "Fake")
                    } label: {
                        HStack {
                            Image("WelcomeAppIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            
                            VStack {
                                Text("Jackson Nguyen").textStyle(LabelStyle())
                                Text("You: Ok Thanks").textStyle(DescriptionStyle())
                            }.frame(maxWidth:  .infinity, alignment: .leading)
                            
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 15)
                    }
                }
            }
        }
        .onAppear {
            friendViewModel.fetchFriends()
        }
            
    }
}

#Preview {
     ListChatScreen()
}
