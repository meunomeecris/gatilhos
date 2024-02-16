//
//  CatilhosApp.swift
//  Catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI
import SwiftData

@main
struct GatilhosApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: [StoreCat.self])
    }
}
