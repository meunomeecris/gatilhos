//
//  MainView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var favoriteViewModel = FavoriteViewModel()
    
    var body: some View {
        VStack {
            HeaderView(text: "CATILHOS", foregroundColor: .blue)
                .padding(.top, 30)
            
            TabView {
                CatsView(catsViewModel: CatsViewModel(), favoriteViewModel: favoriteViewModel)
                    .tabItem {
                        Label("Cats", systemImage: "house")
                    }
                FavoritesView(favoriteViewModel: favoriteViewModel, catsViewModel: CatsViewModel())
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

