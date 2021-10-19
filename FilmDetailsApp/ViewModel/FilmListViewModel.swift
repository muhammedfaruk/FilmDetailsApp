//
//  FilmListViewModel.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 9.10.2021.
//

import Foundation
import SwiftUI


class FilmListViewModel : ObservableObject{
    
   @Published var filmArray = [FilmViewModel]()
    
    let downloaderClient = Downloader()
    
    func filmAramasiYap(filmName :  String){
        
        downloaderClient.downloadData(search: filmName) { response in
            switch response {
              case .failure(let hata):
                print(hata)
              case .success(let filmArray):
                if let filmArray = filmArray{
                    DispatchQueue.main.async {
                        self.filmArray = filmArray.map(FilmViewModel.init)  // map sayesinde dönüşümü yaptık
                    }
                }
            }
        }
    }
}


//kullanıcıya gösterilecel bilgiler
struct FilmViewModel {
    
    let film : Film
    
    var title : String {
        film.title
    }
    var imdbID : String{
        film.imdbID
    }
    var year : String{
        film.year
    }
    var poster : String {
        film.poster
    }
}
