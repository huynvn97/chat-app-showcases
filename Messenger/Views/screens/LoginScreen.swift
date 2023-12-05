//
//  LoginScreen.swift
//  Messenger
//
//  Created by ad on 02/12/2023.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var authViewModel: AuthViewModal
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("WelcomeAppIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                
                Text("Login with phone number or Facebook account")
                    .textStyle(TitleStyle())
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                
                
                TextField("Phone number or email", text: $username)
                    .textFieldStyle(BorderedTopTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textFieldStyle(BorderedTopTextFieldStyle())
                
                Button("Login", action: {
                    authViewModel.login(username: username, password: password)
                })
                
                NavigationLink {
                    Text("Signup")
                } label: {
                    Text("Try signup")
                }
            }
            .background(.white)
            .padding(.horizontal, 15)
            
        }
    }
}

#Preview {
    LoginScreen()
}
