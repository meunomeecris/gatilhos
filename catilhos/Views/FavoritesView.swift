//
//  FavoritesView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favoriteViewModel: FavoriteViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(favoriteViewModel.favorites, id: \.self) { item in
                    let url = URL(string: item.url)
                    AsyncImage(url: url, content: { returnedImage in
                        returnedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                            .padding(16)
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 150, height: 100)
                    .padding()
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoriteViewModel: FavoriteViewModel())
    }
}
