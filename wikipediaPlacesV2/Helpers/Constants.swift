//
//  Constants.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation

enum SegueNames: String {
    case locationPickerSegue = "locationPickerSegue"
}

struct WikipediaConstants {
    
    /** the base url scheme for the wikipedia app
     
     @return Wikipedia base url
     
     */
    static var wikipediaBaseUrl: URL? {
        
        return URL(string: "wikipedia://")
        
    }
    
    /** converts a place into a wikipedia deep link
     
     @param Place the place for the URL
     @return The deep link URL for wikipedia
     
     */
    static func wikipediaUrl(place: Place) -> URL? {
        
        let urlString = "wikipedia://places?name=\(place.name.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) ?? "")&latitude=\(place.latitude)&longitude=\(place.longitude)"
        
        return URL(string: urlString)
        
    }
    
}

enum ErrorMessages: String {
    
    case wikipediaOpenErrorTitle = "Error"
    case wikipediaOpenErrorMessage = "Cannot open the place. Please ensure you have installed the wikipedia app and try again."
    
}
