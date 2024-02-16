//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI
import SwiftData

struct CatsView: View {
    @Binding var viewModel: CatsViewModel
    var catManager: CatManager

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HeaderView(viewModel: $viewModel)
                    .padding(.top, 30)
                Spacer()
                LoadImage(viewModel: viewModel)
                Spacer()
                MoreButton(catManager: viewModel.catManager, viewModel: viewModel)
                    .frame(height: 50)
            }
        }
        .onAppear {
            Task {
                await catManager.fetchCat()
                viewModel.loadImage()
            }
        }
        .sheet(isPresented: $viewModel.isPresented, content: {
            NavigationStack {
                FavoriteListView(catManager: catManager)
            }
        })
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView(viewModel: .constant(CatsViewModel(catManager: CatManager())), catManager: CatManager())
    }
}


struct HeaderView: View {
    @Binding var viewModel: CatsViewModel

    var body: some View {
        HStack {
            Image("catLogo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(.white)
                .frame(width: 60, height: 60)
                .cornerRadius(60/2)
                .overlay {
                    Circle()
                        .stroke(.indigo, lineWidth: 3)
                }
            VStack(alignment: .leading) {
                Text("GATILHOS")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .tracking(2)
                Text("fofinhos")
                    .font(.title3)
                    .foregroundColor(.white)
                    .tracking(7)
            }
            Spacer()
            Button("Fav") {
                viewModel.isPresented = true
            }
            .padding(.trailing, 16)
        }
        .padding(.leading, 16)
        .padding(.bottom, 12)
    }
}

struct MoreButton: View {
    var catManager: CatManager
    var viewModel: CatsViewModel

    var body: some View {
        VStack {
            Button(action: {
                Task {
                    await catManager.fetchCat()
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
    }
}

struct FavoriteButton: View {
    var catManager: CatManager
    var viewModel: CatsViewModel

    var body: some View {
        Button(action: {
            catManager.favoriteCat(catManager.cat)
        }, label: {
            if catManager.isFavorite(catManager.cat) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.green)
            } else {
                Image(systemName: "heart")
                    .font(.system(size: 20))
            }
        })
        .foregroundColor(.white)
    }
}


struct TitleCatsInput: View {
    @Environment(\.modelContext) private var context
    @Bindable var viewModel: CatsViewModel

    var body: some View {
        HStack {
            TextFieldComponent(
                placeholder: "Give me a title",
                text: $viewModel.titleCatsInput
            )
            if !viewModel.titleCatsInput.isEmpty {
                Button(action: {
                    guard let urlString = viewModel.catManager.cat?.url else { return }
                    let storeTitleCat = StoreCat(title: viewModel.titleCatsInput, url: urlString)
                    context.insert(storeTitleCat)
                    viewModel.titleCatsInput = ""
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

struct LoadImage: View {
    var viewModel: CatsViewModel

    var body: some View {
        VStack {
            if let image = viewModel.image {
                ZStack(alignment: .topTrailing) {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
//                    FavoriteButton(catManager: viewModel.catManager, viewModel: viewModel)
                        .padding([.top, .trailing], 8)
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
        .padding([.trailing, .leading],16)
    }
}
