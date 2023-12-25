//
//  MainScreen.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import SwiftUI

struct MainScreen: View {
    @State var activeScreenTag: SCREEN_NAMES?
    
    var body: some View {
        VStack {
            NavigationLink(destination: ChatScreen(), tag: SCREEN_NAMES.CHAT_SCREEN, selection: $activeScreenTag) { EmptyView()
            }
            TabView {
            
                ListChatScreen(activeScreenTag: $activeScreenTag).tabItem {
                    Label("Chat", systemImage: "message.fill")
                }
                
                SettingScreen().tabItem {
                    Label("Settings", systemImage: "gear")
                }
            }
        }.background(.white)
    }
}

#Preview {
    MainScreen()
}
