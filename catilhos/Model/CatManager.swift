//
//  CatManager.swift
//  catilhos
//
//  Created by Cris Messias on 09/02/24.

import Foundation

@Observable class CatManager {
    var cat: Cat?

    public init(cat: Cat? = nil) {
        self.cat = cat
    }

    func fetchCat() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_3fkeBqVXOWac6Gi7JGCbYlGV3v6ac3YQyCnvpKhSWecNSVdh3Tkrltqn2XgMRCjl") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let catData = try JSONDecoder().decode([Cat].self, from: data)
            if let cat = catData.first {
                DispatchQueue.main.async {
                    self.cat = cat
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}


