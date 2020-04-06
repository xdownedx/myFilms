//
//  menuTable.swift
//  myFilms
//
//  Created by Максим Лисицкий on 06.04.2020.
//  Copyright © 2020 Максим Лисицкий. All rights reserved.
//

import UIKit

class menuTable: UITableViewController {

    let FilmNames = [
        "Gentelmen","Klaus","Joker","Ford vs Ferrari","1917",
        "Gisaengchung","Jojo Rabit","Knife Out","Avengers","Togo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FilmNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        cell.nameOfFilm?.text = FilmNames[indexPath.row]
 

        cell.imageOfFilm?.image = UIImage(named:FilmNames[indexPath.row])
        
        
        return cell
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }


    /*

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
