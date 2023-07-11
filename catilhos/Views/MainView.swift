//
//  MainView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct MainView: View {    
    var body: some View {
        TabView {
            CatsView()
                .tabItem {
                    Label("Cats", systemImage: "house")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

