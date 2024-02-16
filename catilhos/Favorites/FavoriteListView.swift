//
//  FavoriteListView.swift
//  gatilhos
//
//  Created by Cris Messias on 16/02/24.
//

import SwiftUI
import SwiftData

struct FavoriteListView: View {
    var catManager: CatManager
    @Environment(\.modelContext) private var context
    @Query private var storeCat: [StoreCat]

    var body: some View {
        List {
            ForEach (storeCat) { cat in
                let url = URL(string: cat.url)
                VStack {
                    HStack {
                        AsyncImage(url: url, content: { returnedImage in
                            Rectangle()
                                .frame(height: 120)
                                .cornerRadius(12)
                                .overlay(
                                    returnedImage
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()

                                )
                        }, placeholder: {
                            ProgressView()
                        })
                        Text(cat.title)
                    }
                }
            }
            .onDelete { indexes in
                for index in indexes {
                    context.delete(storeCat[index])
                }
            }
        }
    }
}

#Preview {
    FavoriteListView(catManager: CatManager())
}
