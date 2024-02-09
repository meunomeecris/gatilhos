//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject var viewModel: CatsViewModel

    var body: some View {
        VStack {
            HeaderView()
                .padding(.top, 30)
            Spacer()
            if let urlString = viewModel.catManager.cat?.url,
               let url = URL(string: urlString),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                ProgressView()
                    .font(.system(.headline))
                    .foregroundColor(.gray)
            }
            Spacer()
            TitleCatsInput(viewModel: viewModel)
            HStack(){
                MoreButton(catManager: viewModel.catManager)
                FavoriteButton(catManager: viewModel.catManager)
            }
            .padding()
            .padding(.top, 20)
            .padding(.bottom, 50)
        }
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView(viewModel: CatsViewModel(catManager: CatManager(), titleCatsInput: ""))
    }
}


struct HeaderView: View {
    var body: some View {
        Text("Catilhos")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.primary)
    }
}

struct MoreButton: View {
    @StateObject var catManager: CatManager
    var body: some View {
        Button {
            catManager.fetchCat()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .fill(.blue)
                Text("More")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .bold()
            }
            .frame(maxWidth: 120, maxHeight: 45)
        }

    }
}

struct FavoriteButton: View {
    @StateObject var catManager: CatManager

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
        .frame(maxWidth: 80, maxHeight: 45)
        .background(.red)
        .foregroundColor(.white)
        .cornerRadius(12)
    }
}


struct TitleCatsInput: View {
    @StateObject var viewModel: CatsViewModel

    var body: some View {
        VStack {
            Text("Give me a title")
                .bold()
            TextField("My cat...", text: $viewModel.titleCatsInput)
                .bold()
                .padding()
                .foregroundStyle(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(.indigo)
        }
        .padding()
    }
}
