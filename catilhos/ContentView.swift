//
//  ContentView.swift
//  catilhos
//
//  Created by Cris Messias on 23/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var catImageURL: String = ""
    
    var body: some View {
        VStack {
            if let url = URL(string: catImageURL),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Failed to load cat image.")
            }
        }
        .onAppear {
            fetchCatImage()
        }
    }
    
    func fetchCatImage() {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?api_key=live_zDdhkI9KBZ3NubVIDvk3sbp62qME5SGa1nq7HvOZJI749ghjPr4jVOlu0MsWqSnj") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data,
               let catData = try? JSONDecoder().decode([CatData].self, from: data),
               let catImage = catData.first {
                DispatchQueue.main.async {
                    self.catImageURL = catImage.url
                }
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CatData: Codable {
    let url: String
}
