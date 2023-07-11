//
//  ButtonView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: Double
    let fontText: CGFloat
    let action: () -> Void
    
    var body: some View {
        Button {
           action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                Text(title)
                    .foregroundColor(foregroundColor)
                    .font(.system(size: fontText))
                    .bold()
            }
        }

    }
}

struct ButtonImageView: View {
    let systemImage: String
    let font: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let cornerRadius: Double
    let width: Double
    let height: Double
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemImage)
               
                .font(.system(size: font))
                
        })
        .frame(maxWidth: width, maxHeight: height)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(cornerRadius)
    }
}


struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Button", backgroundColor: .blue, foregroundColor: .white, cornerRadius: 15, fontText: 30, action: {
        })
    }
}

struct ButtonImageView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonImageView(systemImage: "hear", font: 25, backgroundColor: .red, foregroundColor: .blue, cornerRadius: 10, width: 45, height: 45, action: {
            
        })
    }
}
