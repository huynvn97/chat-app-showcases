//
//  MessengerApp.swift
//  Messenger
//
//  Created by ad on 02/12/2023.
//

import SwiftUI
import FirebaseCore

@main
struct MessengerApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
