//
//  LocationsPresenter.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation
import LocationPicker

class PlacesPresenter {
    
    fileprivate weak var placesView: PlacesView?
    fileprivate let places: [Place]? = Place.defaultPlaces
    
    init(placesView: PlacesView) {
        self.placesView = placesView
    }
    
    func didSelectNewLocation(location: Location?) {
        
    }
    
    func cellForRowAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        cell.textLabel?.text = places?[indexPath.row].name ?? "Place"
        return cell
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return places?.count ?? 0
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        guard let selectedPlace = places?[indexPath.row] else {
            return
        }
        
        guard let wikipediaURL = URL(string: "wikipedia://"), UIApplication.shared.canOpenURL(wikipediaURL) else {
            placesView?.showError(title: "Error", message: "Cannot open the place. Please ensure you have installed the wikipedia app and try again.")
            return
        }
        
        let urlString = "wikipedia://places?name=\(selectedPlace.name)&latitude=\(selectedPlace.latitude)&longitude=\(selectedPlace.longitude)"//.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        
        guard let url = URL(string: urlString) else {
            placesView?.showError(title: "Error", message: "Cannot open the place. Please ensure you have installed the wikipedia app and try again.")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
