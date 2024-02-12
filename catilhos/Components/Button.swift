//
//  buttonComponent.swift
//  gatilhos
//
//  Created by Cris Messias on 12/02/24.
//

import SwiftUI

struct TextButton: View {
    let heigth: CGFloat = 40
    var title: String = ""
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 16))
                .bold()
        })
        .frame(maxWidth: .infinity)
        .frame(height: heigth)
        .background(.indigo)
        .cornerRadius(12)
    }
}

struct IconButton: View {
    let maxWidth: CGFloat = 80
    let heigth: CGFloat = 40
    var icon: String = ""
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: icon)
        })
        .frame(maxWidth: maxWidth)
        .frame(height: heigth)
        .background(.white)
        .foregroundColor(.indigo)
        .cornerRadius(12)
    }
}

#Preview {
    VStack {
        TextButton(title: "TextButton", action: {})
        IconButton(icon: "checkmark.circle", action: {})
    }
    .padding(60)
    .background(.black)
}
