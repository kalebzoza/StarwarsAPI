//
//  StarWarsPlanet.swift
//  StarWarPlanet
//
//  Created by Kaleb  Carrizoza on 9/24/20.
//

import Foundation

struct TopLevelDictionary: Decodable {
    let results: StarWarsPlanet
}

struct StarWarsPlanet: Decodable {
    let name: String
    let population: Int
}
