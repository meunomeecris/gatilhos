//
//  CatSavedViewModel.swift
//  gatilhos
//
//  Created by Cris Messias on 18/02/24.
//

import Foundation

@Observable class CatSavedViewModel: Identifiable {
    var id = UUID()
    var catManager: CatManager
    var delegateCloseButtonTapped: () -> Void = { fatalError() }
    
    init(catManager: CatManager) {
        self.catManager = catManager
    }

    func closeButtonTapped() {
        delegateCloseButtonTapped()
    }
}
