//
//  CatsViewModel.swift
//  catilhos
//
//  Created by Cris Messias on 12/07/23.
//

import Foundation

class CatsViewModel: ObservableObject {
    @Published var isFavorite = false
    @Published var catImageURL: String = ""
    
    func fetchCatImage() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_zDdhkI9KBZ3NubVIDvk3sbp62qME5SGa1nq7HvOZJI749ghjPr4jVOlu0MsWqSnj") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data,
               let catData = try? JSONDecoder().decode([CatDataModel].self, from: data),
               let catImage = catData.first {
                DispatchQueue.main.async {
                    self.catImageURL = catImage.url
                }
            }
        }.resume()
    }
}
