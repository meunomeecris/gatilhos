//
//  ButtonView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
           action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold()
            }
            .frame(maxWidth: 120, maxHeight: 45)
        }

    }
}

struct ButtonIconView: View {
    let systemImage: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemImage)
                .font(.system(size: 20))
        })
        .frame(maxWidth: 80, maxHeight: 45)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Button",
                   action: {
        })
    }
}

struct ButtonIconView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonIconView(systemImage: "heart", action: {
            
        })
    }
}
