//
//  MainScreen.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import SwiftUI

struct MainScreen: View {

    var body: some View {
        TabView {
            VStack {
                ListChatScreen()
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
