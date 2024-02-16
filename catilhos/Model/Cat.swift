//
//  CatDataModel.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import Foundation
import SwiftData


struct Cat: Codable, Equatable, Hashable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}

@Model
class StoreCat {
    let title: String
    let url: String

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
