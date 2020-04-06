//
//  menuTable.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class menuTable: UITableViewController {
    /*
    let FilmNames = [
        "Gentelmen","Klaus","Joker","Ford vs Ferrari","1917",
        "Gisaengchung","Jojo Rabit","Knife Out","Avengers","Togo"]
    */
    let cinema = [filmModel(name: "Джентельмены", year: 2019,country:"USA", ganre:"Comedy", image: "Gentelmen")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cinema.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        cell.nameOfFilm?.text = cinema[indexPath.row].name
        cell.yearOfFilm.text = "(\(cinema[indexPath.row].year))"
        cell.ganreOfFilm?.text = cinema[indexPath.row].ganre
        cell.imageOfFilm?.image = UIImage(named:cinema[indexPath.row].image)
        cell.countryOfFilm?.text = cinema[indexPath.row].country
        
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
}
