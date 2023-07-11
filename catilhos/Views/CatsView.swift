//
//  CatsView.swift
//  catilhos
//
//  Created by Cris Messias on 11/07/23.
//

import SwiftUI

struct CatsView: View {
    @StateObject var viewModel = RequestViewModel()
    
    var body: some View {
        VStack {
            HeaderView(text: "CATILHOS", foregroundColor: .white)
            
            Spacer()
            
            if let url = URL(string: viewModel.catImageURL),
               let imageData = try? Data(contentsOf: url),
               let image = UIImage(data: imageData) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                Text("Failed to load cat image.")
                    .foregroundColor(Color.white)
                    .aspectRatio(contentMode: .fill)
                    .background(Color.black)
            }
            
            Spacer()
            
            HStack(){
                ButtonView(
                    title: "MORE PHOTOS",
                    backgroundColor: .blue,
                    foregroundColor: .white,
                    cornerRadius: 10,
                    fontText: 16,
                    action: {
                        viewModel.fetchCatImage()
                    })
                .frame(maxWidth: .infinity, maxHeight: 45)
                
                Spacer()
                
                ButtonImageView(
                    systemImage: "heart",
                    font: 25,
                    backgroundColor: .red,
                    foregroundColor: .white,
                    cornerRadius: 10,
                    width: 45, height: 45,
                    action: {
                        
                    })
            }
            .padding()
            .padding(.top, 20)
            .padding(.bottom, 80)
            
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}

struct CatsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsView()
    }
}
