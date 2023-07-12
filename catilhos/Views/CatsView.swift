//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject var catsViewModel = CatsViewModel()
    @StateObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        VStack {
            Spacer()
            if let urlString = catsViewModel.cat?.url,
               let url = URL(string: urlString),
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
                    systemImage: favoriteViewModel.isFavorite(catsViewModel.cat) ? "heart.fill" : "heart",
                    font: 25,
                    backgroundColor: .red,
                    foregroundColor: .white,
                    cornerRadius: 10,
                    width: 80, height: 45,
                    action: {
                        favoriteViewModel.favoriteCat(catsViewModel.cat)
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
        CatsView(favoriteViewModel: FavoriteViewModel())
    }
}
