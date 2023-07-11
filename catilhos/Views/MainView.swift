//
//  MainView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct MainView: View {    
    var body: some View {
        VStack {
            HeaderView(
                text: "CATILHOS",
                foregroundColor: .blue)
            .padding(.top, 30)
            
            TabView {
                CatsView()
                    .tabItem {
                        Label("Cats", systemImage: "house")
                            .foregroundColor(.white)
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                            .foregroundColor(.white)
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

