//
//  TextField.swift
//  gatilhos
//
//  Created by Cris Messias on 12/02/24.
//

import SwiftUI

struct TextFieldComponent: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
       TextField(placeholder, text: $text)
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.leading)
            .padding([.leading, .trailing], 16)
            .foregroundStyle(.indigo)
            .background(.white)
            .cornerRadius(10)
    }
}

#Preview {
    TextFieldComponent(placeholder: "TextField", text: .constant(""))
}
