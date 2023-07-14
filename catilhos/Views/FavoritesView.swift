//
//  FavoritesView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var favoriteViewModel: FavoriteViewModel
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(favoriteViewModel.favorites, id: \.self) { item in
                    let url = URL(string: item.url)
                    AsyncImage(url: url, content: { returnedImage in
                        Rectangle()
                            .frame(height: 120)
                            .cornerRadius(12)
                            .overlay(
                                returnedImage
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                                
                            )
                    }, placeholder: {
                        ProgressView()
                    })
                }
            }
            .padding()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoriteViewModel: FavoriteViewModel())
    }
}
