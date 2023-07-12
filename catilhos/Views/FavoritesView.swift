//
//  FavoritesView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct FavoritesView: View {
    let items = (1...20).map { "Item \($0)" } //test
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        
                        //Favorites Images
                        Text(item)
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
        FavoritesView()
    }
}
