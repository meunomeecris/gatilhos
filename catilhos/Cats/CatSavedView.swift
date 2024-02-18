//
//  CatSavedView.swift
//  gatilhos
//
//  Created by Cris Messias on 17/02/24.
//

import SwiftUI
import SwiftData

struct CatSavedView: View {
    @Environment(\.modelContext) private var context
    @Query private var storeCat: [StoreCat]
    var viewModel: CatSavedViewModel

    var body: some View {
        NavigationStack{
            if storeCat.isEmpty {
                EmptyStateView()
            }
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
            .toolbar {
                ToolbarItem {
                    Button("Close") {
                        viewModel.closeButtonTapped()
                    }
                }
            }
            .navigationTitle("My cats")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CatSavedView(viewModel: CatSavedViewModel(catManager: CatManager()))
}

struct EmptyStateView: View {
    var body: some View {
        NavigationStack{
            VStack {
                Image("womanImage")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                Text("No cats found!")
                    .font(.title2)
            }
            .frame(width: 300, height: 300)
        }
    }
}
