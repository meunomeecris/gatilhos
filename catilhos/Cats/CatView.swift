//
//  CatView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI
import SwiftData

struct CatView: View {
    @Binding var viewModel: CatViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack {
                    Spacer()
                    LoadImageView(viewModel: viewModel)
                    Spacer()
                    MoreButton(viewModel: viewModel)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Text("GATILHOS")
                        .foregroundStyle(.white)
                        .bold()
                        .tracking(2.0)
                }
                ToolbarItem {
                    Button("Favorites") {
                        viewModel.favoritesButtonTapped()
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 12))
                    .background(.indigo)
                    .cornerRadius(8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await viewModel.catManager.fetchCat()
                    viewModel.loadImage()
                }
            }
            .sheet(item: $viewModel.catSavedViewModel, content: { catSavedViewModel in
                CatSavedView(viewModel: catSavedViewModel)
            })

        }
    }
}

#Preview {
    CatView(viewModel: .constant(CatViewModel(catManager: CatManager())))
}

struct LoadImageView: View {
    var viewModel: CatViewModel

    var body: some View {
        VStack {
            if let image = viewModel.image {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(4)
                }
                HStack(alignment: .bottom)  {
                    TitleCatsInput(viewModel: viewModel)
                }
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.white, lineWidth: 3.0)
        }
        .padding([.trailing, .leading],1)
    }
}

struct TitleCatsInput: View {
    @Environment(\.modelContext) private var context
    @Bindable var viewModel: CatViewModel

    var body: some View {
        HStack {
            TextField("Give me a title", text: $viewModel.titleCatsInput)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing], 16)
                .foregroundStyle(.indigo)
                .background(.white)
                .cornerRadius(10)
            if !viewModel.titleCatsInput.isEmpty {
                Button(action: {
                    viewModel.storedURLAndTitleCatButtonTapped(context)
                }, label: {
                    Text("Save")
                        .padding(.trailing, 16)
                        .foregroundStyle(.green)
                        .bold()
                })
                .frame(height: 50)
            }
        }
    }
}

struct MoreButton: View {
    var viewModel: CatViewModel

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await viewModel.catManager.fetchCat()
                    viewModel.loadImage()
                }
            }, label: {
                Text("More cute cats")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold()
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.indigo)
            .cornerRadius(12)
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(height: 50)
    }
}



