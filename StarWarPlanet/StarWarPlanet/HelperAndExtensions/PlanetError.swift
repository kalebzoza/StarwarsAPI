//
//  PlanetError.swift
//  StarWarPlanet
//
//  Created by Kaleb  Carrizoza on 9/24/20.
//

import Foundation

enum PlanetError: LocalizedError {
    //first error is the invalid URL
    case invalidURL
    case thrownError(Error)
    case noData
   
    var errorDescription: String? {
        switch self {
        
        case .invalidURL:
            return " The sever failed to reach the necessary URL"
        case .thrownError(let error):
            return " There was an error \(error.localizedDescription)"
        case .noData:
            return "No data found "
        }
    }
}
