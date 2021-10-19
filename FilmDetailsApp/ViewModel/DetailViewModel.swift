//
//  DetailViewModel.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 13.10.2021.
//

import Foundation
import SwiftUI

class DetailViewModel : ObservableObject{
    
    @Published var filmDetail : FilmDetailViewModel?
    
    let downloadClient = Downloader()
    
    func searchFilmDetail(imdbID : String){
        
        downloadClient.downloadDetail(imdb: imdbID) { response in
                       
            switch response{
            case .success(let filmDetail):
                
                if let filmDetail = filmDetail {
                    DispatchQueue.main.async {
                        self.filmDetail = FilmDetailViewModel(detail: filmDetail)
                    }
                    
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct FilmDetailViewModel {
    
    let detail : Detail
    
    var title : String{
        detail.title
    }
    
    var year : String{
        detail.year
    }
    
    var imdbRating : String{
        detail.imdbRating
    }
    
    var released : String{
        detail.released
    }
    
    var plot : String{
        detail.plot
    }
    
    var poster : String{
        detail.poster
    }
    
}
