//
//  ContentView.swift
//  Messenger
//
//  Created by ad on 02/12/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel = AuthViewModal()
    
    init() {
        authViewModel.checkAuth()
    }

    var body: some View {
        NavigationView {
            
                if (authViewModel.isLoggedIn) {
                    MainScreen()
                } else {
                    LoginScreen()
                }
        }.environmentObject(authViewModel)
    }
}

#Preview {
    ContentView()
}
