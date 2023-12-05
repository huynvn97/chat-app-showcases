//
//  ContentView.swift
//  Messenger
//
//  Created by ad on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModal()
    
    var body: some View {
        NavigationView {
                if (authViewModel.isLoggedIn) {
                    MainScreen()
                } else {
                    LoginScreen()
                }
        }.environmentObject(authViewModel)
            .onAppear {
                authViewModel.checkAuth()
            }

    }
}

#Preview {
    ContentView()
}
