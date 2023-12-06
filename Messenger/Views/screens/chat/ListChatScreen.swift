//
//  ListChatScreen.swift
//  Messenger
//
//  Created by ad on 05/12/2023.
//

import SwiftUI

struct ListChatScreen: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("WelcomeAppIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                    VStack {
                        Text("Jackson Nguyen").textStyle(LabelStyle())
                        Text("You: Ok Thanks").textStyle(DescriptionStyle())
                    }.frame(maxWidth:  .infinity, alignment: .leading)
                    
                }.padding(.horizontal, 15)
                .padding(.vertical, 15)
                
                HStack {
                    Image("WelcomeAppIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                    VStack {
                        Text("Jackson Nguyen").textStyle(LabelStyle())
                        Text("You: Ok Thanks").textStyle(DescriptionStyle())
                    }.frame(maxWidth:  .infinity, alignment: .leading)
                    
                }.padding(.horizontal, 15)
                .padding(.vertical, 8)
                
                HStack {
                    Image("WelcomeAppIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    
                    VStack {
                        Text("Jackson Nguyen").textStyle(LabelStyle())
                        Text("You: Ok Thanks").textStyle(DescriptionStyle())
                    }.frame(maxWidth:  .infinity, alignment: .leading)
                    
                }.padding(.horizontal, 15)
                .padding(.vertical, 15)
                
            }
        }
    }
}

#Preview {
    ListChatScreen()
}
