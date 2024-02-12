//
//  CatsViewModel.swift
//  catilhos
//
//  Created by Cris Messias on 09/02/24.
//

import Foundation
import SwiftUI

@Observable class CatsViewModel {
    var catManager: CatManager
    var titleCatsInput: String
    var image: UIImage?
    let maxWidth: CGFloat = 80
    let heigth: CGFloat = 40
    
    init(catManager: CatManager, titleCatsInput: String = "", image: UIImage? = nil) {
        self.catManager = catManager
        self.titleCatsInput = titleCatsInput
        self.image = image
    }

    func loadImage() {
        guard let urlString = catManager.cat?.url, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }

            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
        }
        .resume()
    }
}
