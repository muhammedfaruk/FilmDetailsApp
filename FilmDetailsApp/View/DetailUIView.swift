//
//  DetailUIView.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 13.10.2021.
//

import SwiftUI

struct DetailUIView: View {
    
    @ObservedObject var details = DetailViewModel()
    
    let imdbID : String
    

    var body: some View {
     
        VStack(alignment : .leading){
        
            ImageUIView(url: details.filmDetail?.poster ?? "").frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            
            Text(details.filmDetail?.title ?? "Başlık gelicek").padding().font(.title).foregroundColor(.blue)
            Text("imdb Puanı: \(details.filmDetail?.imdbRating ?? "")").padding()
            Text("Yayınlandığı Tarih: \(details.filmDetail?.released ?? "")").padding()
            Text(details.filmDetail?.plot ?? "").padding()
        
            Spacer()
        }.onAppear {
            self.details.searchFilmDetail(imdbID: imdbID)
           }
    }
}

struct DetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailUIView(imdbID: "tt3896198")
    }
}
