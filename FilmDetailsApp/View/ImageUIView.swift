//
//  ImageUIView.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 9.10.2021.
//

import SwiftUI

struct ImageUIView: View {
    
    @ObservedObject var imageDownloader : ImageDownloader
    
    init(url : String){
        self.imageDownloader = ImageDownloader()
        self.imageDownloader.downloadImage(url: url)
    }
    
    
    var body: some View {
     
        
        if let data = self.imageDownloader.downloadedImage {
            Image(uiImage: UIImage(data: data)!)
                .resizable()
        }else {
            Image("placeholder")
                .resizable()
        }
        
}

struct ImageUIView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUIView(url: "https://m.media-amazon.com/images/M/MV5BYTVkYTAyZDMtYzNmYi00OTkyLTg3M2ItNmE0MDZkNmY3Y2I3XkEyXkFqcGdeQXVyNjU2MDUzMjY@._V1_SX300.jpg")
    }
 }
}
