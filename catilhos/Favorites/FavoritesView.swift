//
//  FavoritesView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var catManager: CatManager
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(catManager.favorites, id: \.self) { item in
                    let url = URL(string: item.url)
                    VStack {
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
                        RemoveButton(catManager: catManager)
                        .frame(height: 45)
                        .padding()
                    }
                }
            }
            .padding()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(catManager: CatManager())
    }
}


struct RemoveButton: View {
    @StateObject var catManager: CatManager

    var body: some View {
        Button("Remove", action: {
            catManager.deleteFavorite(catManager.cat)
        })
        .frame(maxWidth: 80, maxHeight: 45)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}
