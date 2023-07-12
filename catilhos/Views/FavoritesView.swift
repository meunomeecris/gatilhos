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
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(favoriteViewModel.favorites, id: \.self) { item in
                    VStack {
                        
                        //Favorites Images
                        Text(item.url)
                            .padding(40)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                        //Date that was favorited
                        Text("Data")
                    }
                }
            }
            .padding()
            .padding(.top, 12)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(favoriteViewModel: FavoriteViewModel())
    }
}
