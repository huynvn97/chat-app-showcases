//
//  CustomText.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import SwiftUI

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.black)
    }
}

#Preview {
    Text("Hello, world, this is title text long long").textStyle(TitleStyle())
}
