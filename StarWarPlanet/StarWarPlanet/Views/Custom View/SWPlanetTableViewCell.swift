//
//  SWPlanetTableViewCell.swift
//  StarWarPlanet
//
//  Created by Kaleb  Carrizoza on 9/24/20.
//

import UIKit




class SWPlanetTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var planetLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    //MARK: - Properties
    var starWarsPlanets: StarWarsPlanet?
    //MARK: - Helpers
    func updateViews() {
        if let starWarsPlanet = starWarsPlanets {
            planetLabel.text = starWarsPlanet.name
            populationLabel.text = "\(starWarsPlanet.population)"
        }
    }
 

}//end of class

