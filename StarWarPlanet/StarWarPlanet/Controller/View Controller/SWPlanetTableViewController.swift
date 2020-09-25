//
//  SWPlanetTableViewController.swift
//  StarWarPlanet
//
//  Created by Kaleb  Carrizoza on 9/24/20.
//

import UIKit

class SWPlanetTableViewController: UITableViewController {
    //MARK: -Outlets
    @IBOutlet weak var planetSearchBar: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        planetSearch()
    }
    
    //MARK: - Properties
    var starWarsPlanets: [StarWarsPlanet] = []
    
    //MARK: - Helper
    func planetSearch() {
        guard let searchTerm = planetSearchBar.text, !searchTerm.isEmpty else { return }
        SWPlanetController.fetchPlanet(searchTerm: searchTerm) { (results) in
            switch results {
            
            case .success(let planet):
                self.starWarsPlanets = planet
            case .failure(let error):
                print(error.localizedDescription)
            }
        
        
            }
            
        }
    
        
    


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return starWarsPlanets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? SWPlanetTableViewCell else { return UITableViewCell() }
        
        cell.updateViews()

        return cell
    }
}// end of class

extension SWPlanetTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        planetSearch()
    }
}
