//
//  MainView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct MainView: View {
    var catManager = CatManager()
    
    var body: some View {
        VStack {
            TabView {
                CatsView(viewModel: CatsViewModel(catManager: catManager), catManager: catManager)
                    .tabItem {
                        Label("Cats", systemImage: "house")
                    }
                FavoritesView(catManager: catManager)
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

