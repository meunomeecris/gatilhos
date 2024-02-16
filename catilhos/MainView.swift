//
//  MainView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct MainView: View {
    var catManager = CatManager()

    var body: some View {
        VStack {
            CatsView(viewModel: .constant(CatsViewModel(catManager: catManager)), catManager: catManager)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

