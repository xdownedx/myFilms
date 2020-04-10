//
//  FilmInformation.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import RealmSwift

class  filmModel:Object {
    @objc dynamic var name = ""
    @objc dynamic var year = ""
    @objc dynamic var country: String?
    @objc dynamic var ganre: String?
    @objc dynamic  var imageData: Data?
    
    convenience init(name:String,year:String,country:String?,ganre:String?,imageData:Data?){
        self.init()
        self.name = name
        self.year = year
        self.country = country
        self.ganre = ganre
        self.imageData = imageData
    }
    
}
