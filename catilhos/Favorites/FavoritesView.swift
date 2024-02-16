////
////  FavoritesView.swift
////  catilhos
////
////  Created by Cris Messias on 11/07/23.
////
//
//import SwiftUI
//import SwiftData
//
//struct FavoritesView: View {
//    var catManager: CatManager
//    @Query private var catTitle: [StoreCat]
//
//    var body: some View {
//        List {
//            ForEach(catTitle) { title in
//                FavoriteList(catManager: catManager, titleCat: title)
//            }
//        }
//    }
//}
//
//#Preview {
//    FavoritesView(catManager: CatManager())
//}
//
//struct FavoriteList: View {
//    var catManager: CatManager
//    var titleCat: StoreCat
//    @Query private var catTitle: [StoreCat]
//
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
//
//    var body: some View {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    LoadFavImage(catManager: catManager)
//                    Text(titleCat.title)
//                }
//            }
//    }
//
//}
//
//struct RemoveButton: View {
//    var catManager: CatManager
//    var body: some View {
//        Button("Remove", action: {
//            catManager.deleteFavorite(catManager.cat)
//        })
//        .foregroundColor(.red)
//    }
//}
//
//
//struct LoadFavImage: View {
//    var catManager: CatManager
//
//    var body: some View {
//        ForEach(catManager.favorites, id: \.self) { item in
//            let url = URL(string: item.url)
//            VStack {
//                AsyncImage(url: url, content: { returnedImage in
//                    Rectangle()
//                        .frame(height: 120)
//                        .cornerRadius(12)
//                        .overlay(
//                            returnedImage
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .clipped()
//
//                        )
//                }, placeholder: {
//                    ProgressView()
//                })
//                RemoveButton(catManager: catManager)
//                    .frame(height: 45)
//                    .padding()
//            }
//        }
//    }
//}
