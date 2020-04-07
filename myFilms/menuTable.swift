//
//  menuTable.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class menuTable: UITableViewController {
    
    var cinema = filmModel.getFilm()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinema.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let films = cinema[indexPath.row]

        cell.nameOfFilm?.text = films.name
        cell.yearOfFilm.text = "(\(films.year))"
        cell.ganreOfFilm?.text = films.ganre
        cell.countryOfFilm?.text = films.country
        
        if films.newImage == nil {
                   cell.imageOfFilm.image = UIImage(named: films.image!)
               } else {
                   cell.imageOfFilm.image = films.newImage
               }
        
        return cell
    }
    
   
    
    


    /*

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelButton(_ segue: UIStoryboardSegue) {
        
    }
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
           
           guard let newFilmVC = segue.source as? NewCinemaTable else { return }
           
           newFilmVC.saveNewFilm()
        
           cinema.append(newFilmVC.newCinema!)
           tableView.reloadData()
       }
    
}
