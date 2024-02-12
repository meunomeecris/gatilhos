//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    var viewModel: CatsViewModel
    var catManager: CatManager

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HeaderView()
                    .padding(.top, 30)
                Spacer()
                VStack {
                    if let image = viewModel.image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                }
                Spacer()
                TitleCatsInput(viewModel: viewModel)
                HStack(){
                    MoreButton(catManager: viewModel.catManager, viewModel: viewModel)
                    FavoriteButton(catManager: viewModel.catManager, viewModel: viewModel)
                }
                .padding()
                .onAppear {
                    Task {
                        await catManager.fetchCat()
                        viewModel.loadImage()
                    }
                }
            }
        }
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView(viewModel: CatsViewModel(catManager: CatManager(), titleCatsInput: ""), catManager: CatManager())
    }
}


struct HeaderView: View {
    var body: some View {
        VStack {
            Text("Gatilhos")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("My little, beautiful, cute cats")
                .font(.subheadline)
                .foregroundColor(.white .opacity(0.8))
        }
    }
}

struct MoreButton: View {
    var catManager: CatManager
    var viewModel: CatsViewModel

    var body: some View {
        TextButton(title: "More cute cats") {
            Task {
                await catManager.fetchCat()
                viewModel.loadImage()
            }
        }
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
            } else {
                Image(systemName: "heart")
                    .font(.system(size: 20))
            }
        })
        .frame(maxWidth: viewModel.maxWidth)
        .frame(height: viewModel.heigth)
        .background(.green)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}


struct TitleCatsInput: View {
    @Bindable var viewModel: CatsViewModel

    var body: some View {
        VStack(alignment:.leading) {
            Text("Give me a title")
                .bold()
                .font(.title3)
                .foregroundStyle(.white)
            HStack {
                TextFieldComponent(
                    placeholder: "I'm crazy, but I'm freee...",
                    text: $viewModel.titleCatsInput
                )
                if !viewModel.titleCatsInput.isEmpty {
                    IconButton(icon: "checkmark.circle") {

                    }
                }
            }
        }
        .padding(20)
    }
}



