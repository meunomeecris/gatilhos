//
//  FavoriteViewModel.swift
//  catilhos
//
//  Created by Cris Messias on 12/07/23.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favorites: [CatDataModel] = []
    
    func favoriteCat(_ cat: CatDataModel?) {
        guard let cat = cat else {
            return
        }
        favorites.append(cat)
    }
    
    func isFavorite(_ cat: CatDataModel?) -> Bool {
        guard let cat = cat else {
            return false
        }
        let isFav = favorites.contains(cat)
        return isFav
    }
    
    
}
