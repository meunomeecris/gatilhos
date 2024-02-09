//
//  CatsViewModel.swift
//  catilhos
//
//  Created by Cris Messias on 09/02/24.
//

import Foundation
import SwiftUI

class CatsViewModel: ObservableObject {
    @Published var catManager: CatManager
    @Published var titleCatsInput: String

    init(catManager: CatManager, titleCatsInput: String = "") {
        self.catManager = catManager
        self.titleCatsInput = titleCatsInput
    }

}
