//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject var catsViewModel = CatsViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            if let url = URL(string: catsViewModel.catImageURL),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading images...")
                    .font(.system(.headline))
                    .foregroundColor(.gray)
            }
                
            
            Spacer()
            
            HStack(){
                ButtonView(
                    title: "MORE",
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    cornerRadius: 10,
                    fontText: 16,
                    action: {
                        catsViewModel.fetchCatImage()
                    })
                .frame(maxWidth: 120, maxHeight: 45)
                
//                Spacer()
                
                ButtonImageView(
                    systemImage: catsViewModel.isFavorite ? "heart.fill" : "heart",
                    font: 25,
                    backgroundColor: .red,
                    foregroundColor: .white,
                    cornerRadius: 10,
                    width: 80, height: 45,
                    action: {
                        catsViewModel.isFavorite.toggle()
                    })
            }
            .padding()
            .padding(.top, 20)
            .padding(.bottom, 50)
            
        }
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
