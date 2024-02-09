//
//  CatManager.swift
//  catilhos
//
//  Created by Cris Messias on 09/02/24.
//https://thecatapi.com

import Foundation

class CatManager: ObservableObject {
    @Published var cat: Cat? = nil
    @Published var favorites: [Cat] = []
    @Published var titleCat: String = ""

    func fetchCat() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_zDdhkI9KBZ3NubVIDvk3sbp62qME5SGa1nq7HvOZJI749ghjPr4jVOlu0MsWqSnj") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data,
               let catData = try? JSONDecoder().decode([Cat].self, from: data),
               let cat = catData.first {
                DispatchQueue.main.async {
                    self.cat = cat
                }
            }
        }
        .resume()
    }

    func favoriteCat(_ cat: Cat?) {
        guard let cat = cat else {
            return
        }
        favorites.append(cat)
    }


    func isFavorite(_ cat: Cat?) -> Bool {
        guard let cat = cat else {
            return false
        }
        let isFav = favorites.contains(cat)
        return isFav
    }


    func deleteFavorite(_ cat: Cat?) {
        guard let cat = cat else {
            return
        }
        if let index = favorites.firstIndex(where: {$0 == cat}) {
            favorites.remove(at: index)
        }
    }
}
