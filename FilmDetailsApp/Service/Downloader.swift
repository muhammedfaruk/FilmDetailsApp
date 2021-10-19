//
//  Downloader.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 9.10.2021.
//

import Foundation
import UIKit


struct Downloader {
    
    func downloadData(search : String, completion : @escaping (Result<[Film]?, DownloadError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=4a2f8d34") else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard data == data , error == nil else {
                return completion(.failure(.dataDownloadError))
            }
            
            guard let productDecoder = try? JSONDecoder().decode(GetFilms.self, from: data!) else {
                return completion(.failure(.jsonError))
                
            }
            
            completion(.success(productDecoder.filmSearch))
        }.resume()
    }
    
    func downloadDetail(imdb: String, completion : @escaping (Result<Detail? , DownloadError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdb)&apikey=4a2f8d34")
        else {
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard  data == data , error == nil else {
                return completion(.failure(.dataDownloadError))
            }
                    
            guard let productDetailDecoder = try? JSONDecoder().decode(Detail.self, from: data!) else {
                return completion(.failure(.jsonError))
            }
            
            completion(.success(productDetailDecoder))
            
        }.resume()
        
    }
}



enum DownloadError : Error {
    case wrongURL
    case dataDownloadError
    case jsonError
}
