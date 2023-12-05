//
//  CustomTextField.swift
//  Messenger
//
//  Created by ad on 03/12/2023.
//

import SwiftUI

extension TextField {
    func textFieldStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

extension SecureField {
    func textFieldStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct BorderedTopTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .padding(.horizontal, 15)
            .padding(.vertical, 15)
            .background(Color.buttonBackgroundGray)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.buttonBackgroundGray, lineWidth: 0)
            }
           
    }
}

struct PreviewTextFields: View {
    @State private var input: String = ""
    
    var body: some View {
        TextField("Input Label", text: $input).textFieldStyle(BorderedTopTextFieldStyle())
    }
   
}

#Preview {
    PreviewTextFields()
}
