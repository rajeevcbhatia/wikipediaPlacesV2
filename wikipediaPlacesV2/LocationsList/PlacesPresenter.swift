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
    
    private weak var placesView: PlacesView?
    private let places: [Place]? = PlaceProvider.defaultPlaces
    private let application: UIApplicationURLHandlingProtocol
    
    init(placesView: PlacesView?, application: UIApplicationURLHandlingProtocol = UIApplication.shared) {
        self.placesView = placesView
        self.application = application
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationPickerVC = segue.destination as? LocationPickerViewController, segue.identifier == SegueNames.locationPickerSegue.rawValue {
            locationPickerVC.completion = didSelectNewLocation
        }
    }
    
    //selected a new location from the location picker
    func didSelectNewLocation(location: Location?) {
        guard let location = location else { return }
        
        let place = Place(name: location.name ?? "Custom Place", latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
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
    
    func didSelectRowAt(indexPath: IndexPath) {
        
        guard let selectedPlace = places?[indexPath.row] else {
            return
        }
        
        openWikipedia(place: selectedPlace)
    }
    
    /** opens the deep link url for the Place */
    private func openWikipedia(place: Place) {
        guard let wikipediaURL = WikipediaConstants.wikipediaBaseUrl, application.canOpenURL(wikipediaURL) else {
            placesView?.showError(title: ErrorMessages.wikipediaOpenErrorTitle.rawValue, message: ErrorMessages.wikipediaOpenErrorMessage.rawValue)
            return
        }
        
        guard let url = WikipediaConstants.wikipediaUrl(place: place) else {
            placesView?.showError(title: ErrorMessages.wikipediaOpenErrorTitle.rawValue, message: ErrorMessages.wikipediaOpenErrorMessage.rawValue)
            return
        }
        
        application.open(url, options: [:], completionHandler: nil)
    }
    
    
}

