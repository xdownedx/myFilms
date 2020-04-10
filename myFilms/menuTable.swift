//
//  menuTable.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class menuTable: UITableViewController {
    
    var cinema:Results<filmModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cinema = realm.objects(filmModel.self)
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinema.isEmpty ? 0 : cinema.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        let films = cinema[indexPath.row]
        
        cell.nameOfFilm?.text = films.name
        cell.yearOfFilm.text = "(\(films.year))"
        cell.ganreOfFilm?.text = films.ganre
        cell.countryOfFilm?.text = films.country
        cell.imageOfFilm.image = UIImage(data: films.imageData!)
        
        return cell
    }
    
     
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            guard let indexPath=tableView.indexPathForSelectedRow else {return}
            let films=cinema[indexPath.row]
            let newCinemaVC = segue.destination as! NewCinemaTable
            newCinemaVC.currentCinema = films
        }
     }
     
    
    //MARK: - Table View Delegate

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            storageManager.deleteObject(self.cinema[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }

    @IBAction func cancelButton(_ segue: UIStoryboardSegue) {
        
    }
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newFilmVC = segue.source as? NewCinemaTable else { return }
        
        newFilmVC.saveNewFilm()
        
        tableView.reloadData()
    }
    
}
