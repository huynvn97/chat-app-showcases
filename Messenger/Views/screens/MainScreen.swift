//
//  MainScreen.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import SwiftUI

struct SearchFriendBox: View {
    @State private var searchText = "";
    var body: some View {
        TextField("Search Friend", text: $searchText).textFieldStyle(BorderedTextFieldStyle())
    }
}

struct MainScreen: View {

    var body: some View {
        TabView {
            VStack {
                SearchFriendBox()
                ListChatScreen()
                Spacer()
            }.tabItem {
                Text("Chat")
            }
            
            SettingScreen().tabItem {
                Text("Settings")
            }
        }
    }
}

#Preview {
    MainScreen()
}
