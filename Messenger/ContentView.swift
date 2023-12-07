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
        .onAppear {
            authViewModel.checkAuth()
        }
    }
}

#Preview {
    ContentView()
}
