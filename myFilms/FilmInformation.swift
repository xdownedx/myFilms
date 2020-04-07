//
//  FilmInformation.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

struct filmModel {
    var name: String
    var year: Int
    var country: String?
    var ganre: String?
    var image: String?
    var newImage: UIImage?
    
    static let cinemaName = [
         "Gentelmen","Klaus","Joker","Ford vs Ferrari","1917",
         "Gisaengchung","Jojo Rabit","Knife Out","Avengers","Togo"
     ]
     
     static func getFilm() -> [filmModel] {
         
         var cinema = [filmModel]()
         
         for films in cinemaName {
             cinema.append(filmModel(name: films, year: 2019,country:"USA", ganre:"Comedy", image: films,newImage: nil))
         }
         
         return cinema
    }
     
}
