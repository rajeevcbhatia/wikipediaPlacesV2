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
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationPickerVC = segue.destination as? LocationPickerViewController, segue.identifier == SegueNames.locationPickerSegue.rawValue {
            locationPickerVC.completion = didSelectNewLocation
        }
    }
    
    func didSelectNewLocation(location: Location?) {
        guard let location = location else { return }
        
        let place = Place(name: location.name ?? location.placemark.name ?? "Custom Place", latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        openWikipedia(place: place)
    }
    
    func cellForRowAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        cell.textLabel?.text = places?[indexPath.row].name ?? "Place"
        return cell
    }
    
    func numberOfRowsIn(section: Int) -> Int {
        return places?.count ?? 0
    }
    
    func didSelectRowAt(indexPath: IndexPath, tableView: UITableView) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let selectedPlace = places?[indexPath.row] else {
            return
        }
        
        openWikipedia(place: selectedPlace)
    }
    
    fileprivate func openWikipedia(place: Place) {
        guard let wikipediaURL = URL(string: "wikipedia://"), UIApplication.shared.canOpenURL(wikipediaURL) else {
            placesView?.showError(title: "Error", message: "Cannot open the place. Please ensure you have installed the wikipedia app and try again.")
            return
        }
        
        let urlString = "wikipedia://places?name=\(place.name.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics) ?? "")&latitude=\(place.latitude)&longitude=\(place.longitude)"
        
        guard let url = URL(string: urlString) else {
            placesView?.showError(title: "Error", message: "Cannot open the place. Please ensure you have installed the wikipedia app and try again.")
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
