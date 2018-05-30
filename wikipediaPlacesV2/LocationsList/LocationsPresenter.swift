//
//  LocationsPresenter.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation
import LocationPicker

class LocationsPresenter {
    
    fileprivate weak var locationsView: LocationsView?
    
    init(locationsView: LocationsView) {
        self.locationsView = locationsView
    }
    
    func addNewLocation() {
        
        let locationPicker = LocationPickerViewController()
        
        locationPicker.showCurrentLocationButton = true
        
        locationPicker.mapType = .standard
        locationPicker.useCurrentLocationAsHint = true // default: false
        locationPicker.completion = { location in
            // do some awesome stuff with location
        }
    }
    
    func didSelectNewLocation(location: Location?) {
        print(location?.address)
    }
    
}
