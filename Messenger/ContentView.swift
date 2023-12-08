//
//  ContentView.swift
//  Messenger
//
//  Created by ad on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModal()
    @StateObject private var friendViewModel = FriendViewModal()
    @StateObject private var messageViewModel = MessageViewModel()
    
    var body: some View {
        NavigationView {
            if (authViewModel.isLoggedIn) {
                MainScreen()
            } else {
                LoginScreen()
            }
        }
        .environmentObject(authViewModel)
        .environmentObject(friendViewModel)
        .environmentObject(messageViewModel)
        .onAppear {
            authViewModel.checkAuth()
        }
    }
}

#Preview {
    ContentView()
}
