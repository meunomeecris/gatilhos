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
    @Query private var storedCat: [StoreCat]
    var viewModel: CatSavedViewModel

    var body: some View {
        NavigationStack {
            if storedCat.isEmpty {
                EmptyStateView()
                    .toolbar {
                        ToolbarItem {
                            Button("Close") {
                                viewModel.closeButtonTapped()
                            }
                        }
                    }
                    .navigationTitle("GATILHOS")
                    .navigationBarTitleDisplayMode(.inline)
            } else {
                List {
                    Section {
                        ForEach (storedCat) { cat in
                            let url = URL(string: cat.url)
                            HStack {
                                AsyncImage(url: url, content: { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(10)
                                }, placeholder: {
                                    ProgressView()
                                })
                                Text(cat.title)
                                    .font(.body)
                            }
                        }
                        .onDelete { indexes in
                            for index in indexes {
                                context.delete(storedCat[index])
                            }
                        }
                    } header: {
                        Text("MY CATS")
                    } footer: {
                        Text("All images that you gaved a title.")
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button("Close") {
                            viewModel.closeButtonTapped()
                        }
                    }
                }
                .navigationTitle("GATILHOS")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CatSavedView(viewModel: CatSavedViewModel(catManager: CatManager()))
}

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Image("womanImage")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            Text("No cats found!")
                .font(.title)
            Text("Add some titles")
                .foregroundStyle(.gray)
        }
        .frame(width: 300, height: 300)
    }
}
