//
//  StorageManager.swift
//  myFilms
//
//  Created by Максим Лисицкий on 08.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class storageManager {
    
    static func saveObject (_ cinema: filmModel){
        
        try! realm.write {
            realm.add(cinema)
            
        }
    }
    static func deleteObject(_ cinema: filmModel){
        
        try! realm.write {
            realm.delete(cinema)
        }
    }
}
