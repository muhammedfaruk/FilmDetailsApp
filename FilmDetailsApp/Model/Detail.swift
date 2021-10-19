//
//  Detail.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 13.10.2021.
//

import Foundation

struct Detail : Codable{
    
    var title : String
    var year  : String
    var imdbRating : String
    var released : String
    var plot : String
    var poster : String
    
    private enum CodingKeys : String, CodingKey{
        
        case title = "Title"
        case year  = "Year"
        case imdbRating = "imdbRating"
        case released = "Released"
        case plot = "Plot"
        case poster = "Poster"
    }
    
    
}
