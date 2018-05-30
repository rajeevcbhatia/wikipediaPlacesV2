//
//  LocationsListViewController.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import UIKit
import LocationPicker

class LocationsListViewController: UIViewController {

    fileprivate var locationsPresenter: LocationsPresenter? = nil
    
    override func viewDidLoad() {
        locationsPresenter = LocationsPresenter(locationsView: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationPickerVC = segue.destination as? LocationPickerViewController, let locationsPresenter = locationsPresenter, segue.identifier == SegueNames.locationPickerSegue.rawValue {
            locationPickerVC.completion = locationsPresenter.didSelectNewLocation
        }
    }
}

extension LocationsListViewController: LocationsView {
    
    
    
}
