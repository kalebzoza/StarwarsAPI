//
//  SWPlanetController.swift
//  StarWarPlanet
//
//  Created by Kaleb  Carrizoza on 9/24/20.
//

import Foundation

struct StringConstant {
    fileprivate static let baseURL = "http://swapi.dev/api"
    fileprivate static let planetEndpoint = "planets"
    fileprivate static let jsonExtension = "json"
}

class SWPlanetController {
    
    static func fetchPlanet(searchTerm: String, completion: @escaping (Result<StarWarsPlanet, PlanetError>) -> Void) {
        
        guard let baseURL = URL(string: StringConstant.baseURL) else { return completion(.failure(.invalidURL)) }
        let planetComponentURL = baseURL.appendingPathComponent(StringConstant.planetEndpoint)
        let finalURl = planetComponentURL.appendingPathComponent(StringConstant.jsonExtension)
        print(finalURl)
        
        URLSession.shared.dataTask(with: finalURl) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else { return completion(.failure(.noData)) }
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                let starWarsPlanets = topLevelDictionary.results
                return completion(.success(starWarsPlanets))
            }catch {
                return completion(.failure(.thrownError(error)))
            }
            
        }.resume()
        
    }
    
    
    
    
}//end of class
