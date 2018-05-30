//
//  LocationsListViewController.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import UIKit
import LocationPicker

class PlacesListViewController: UIViewController {

    fileprivate var placesPresenter: PlacesPresenter!
    
    override func viewDidLoad() {
        placesPresenter = PlacesPresenter(placesView: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationPickerVC = segue.destination as? LocationPickerViewController, segue.identifier == SegueNames.locationPickerSegue.rawValue {
            locationPickerVC.completion = placesPresenter.didSelectNewLocation
        }
    }
}

extension PlacesListViewController: PlacesView {
    
    func showError(title: String, message: String) {
        
    }
    
}

extension PlacesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesPresenter.numberOfRowsIn(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return placesPresenter.cellForRowAt(indexPath: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        placesPresenter.didSelectRowAt(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
