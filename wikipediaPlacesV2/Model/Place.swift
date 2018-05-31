//
//  Place.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation

// the root object in the json file
struct ResponseData: Decodable {
    var places: [Place]
}

/** a place represents a geographical location with a name and coordinates */
struct Place : Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    
    /** the array of hardcoded places from the json file */
    static var defaultPlaces: [Place]? {
        if let url = Bundle.main.url(forResource: "places", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                return jsonData.places
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}


