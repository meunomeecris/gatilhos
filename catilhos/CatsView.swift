//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    var body: some View {
        VStack {
            Text("CATtilhos")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            if let url = URL(string: viewModel.catImageURL),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                Text("Failed to load cat image.")
                    .foregroundColor(Color.white)
                    .aspectRatio(contentMode: .fill)
                    .background(Color.black)
            }
            Spacer()
            Button(action: {
                viewModel.fetchCatImage()
            }) {
                Text("more CATilhos")
                    .padding(25)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(4)
                
            }
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
