//
//  LocationsView.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation

protocol PlacesView: AnyObject {
    
    func showError(title: String, message: String)
    
}
