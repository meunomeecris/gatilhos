//
//  CatDataModel.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import Foundation
import SwiftData


struct Cat: Codable, Equatable {
    let url: String
}

@Model
class StoreCat {
    var title: String
    var url: String

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
