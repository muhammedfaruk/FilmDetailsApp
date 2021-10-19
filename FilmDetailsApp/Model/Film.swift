//
//  Film.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 9.10.2021.
//

import Foundation

struct Film : Codable {
    
    let title  : String
    let year   : String
    let imdbID : String
    let type   : String
    let poster : String
    
    
    private enum CodingKeys : String, CodingKey {
        case title  = "Title"
        case year   = "Year"
        case imdbID   = "imdbID"
        case type   = "Type"
        case poster = "Poster"
    }
       
}

struct GetFilms : Codable {
    
    let filmSearch : [Film]
    
    private enum CodingKeys : String, CodingKey {
        
        case filmSearch = "Search"
        
    }
    
}
