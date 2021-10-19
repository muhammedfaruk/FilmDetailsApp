//
//  ListUIView.swift
//  FilmDetailsApp
//
//  Created by Muhammed Faruk Söğüt on 9.10.2021.
//

import SwiftUI

struct ListUIView: View {
    
   @ObservedObject var filmListViewModel : FilmListViewModel
   @State var searchText = ""
    
    init(){
        self.filmListViewModel = FilmListViewModel()
    }

    var body: some View {
        NavigationView{
            
    VStack{
        TextField("Search film", text: $searchText, onEditingChanged:{_ in}, onCommit: {
            
            self.filmListViewModel.filmAramasiYap(filmName: searchText.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchText)
            
        }).padding().textFieldStyle(RoundedBorderTextFieldStyle())
            .background(Color.blue)
            
            
        List{
            ForEach(filmListViewModel.filmArray, id: \.imdbID){ filmData in
                NavigationLink {
                    DetailUIView(imdbID: filmData.imdbID)
                } label: {  
                    HStack{
                        ImageUIView(url: filmData.poster)                    .frame(width: 120, height: 150)
                        
                        VStack(alignment:.leading){
                            Text(filmData.title)
                                .bold()
                                .font(.title2)
                                .foregroundColor(.blue)
                                
                            Text(filmData.year)
                                .bold()
                                .font(.title3)
                        }
                    }
                }
            }
        }.navigationTitle("FILMS")
      }
    }
  }
}

struct ListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListUIView()
    }
}
