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

struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.headline).fontWeight(.bold).foregroundColor(.black)
    }
}

struct DescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.body).fontWeight(.regular).foregroundColor(.gray)
    }
}

#Preview {
    VStack {
        Text("Label text").textStyle(TitleStyle())
        Text("Description Text").textStyle(DescriptionStyle())
    }
}
