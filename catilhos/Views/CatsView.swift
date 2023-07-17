//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject var catsViewModel: CatsViewModel
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
                ProgressView()
                    .font(.system(.headline))
                    .foregroundColor(.gray)
            }
            
            Spacer()

            HStack(){
                ButtonView(title: "MORE", action: {
                    catsViewModel.fetchCat()
                })
                
                ButtonIconView(
                    systemImage: favoriteViewModel.isFavorite(catsViewModel.cat) ? "heart.fill" : "heart",
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
        CatsView(catsViewModel: CatsViewModel(), favoriteViewModel: FavoriteViewModel())
    }
}
