//
//  CatDataModel.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import Foundation


struct Cat: Codable, Equatable, Hashable {
    let id: String
    let url: String
    let width: Int
    let height: Int
}
