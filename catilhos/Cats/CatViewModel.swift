//
//  CatViewModel.swift
//  catilhos
//
//  Created by Cris Messias on 09/02/24.
//

import Foundation
import SwiftUI
import SwiftData

@Observable class CatViewModel {
    var catManager: CatManager
    var titleCatsInput: String = ""
    var image: UIImage? = nil
    var isPresented: Bool = false
    var catSavedViewModel: CatSavedViewModel? = nil

    init(catManager: CatManager) {
        self.catManager = catManager
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

    func storedURLAndTitleCatButtonTapped(_ context: ModelContext) {
        guard let urlString = catManager.cat?.url else { return }
        let storeTitleCat = StoreCat(title: titleCatsInput, url: urlString)
        context.insert(storeTitleCat)
        titleCatsInput = ""
    }

    func favoritesButtonTapped() {
        catSavedViewModel = CatSavedViewModel(catManager: catManager)
        catSavedViewModel?.delegateCloseButtonTapped = {
            self.catSavedViewModel = nil
        }
    }
}
