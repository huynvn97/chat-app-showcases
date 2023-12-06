//
//  SettingScreen.swift
//  Messenger
//
//  Created by ad on 06/12/2023.
//

import SwiftUI

struct SettingScreen: View {
    @EnvironmentObject private var authViewModel: AuthViewModal
    
    var body: some View {
        Button ("Logout") {
            Task {
                await authViewModel.logout()
            }
        }
    }
}

#Preview {
    SettingScreen()
}
