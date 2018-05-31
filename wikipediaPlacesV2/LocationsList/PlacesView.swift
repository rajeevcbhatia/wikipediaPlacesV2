//
//  LocationsView.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import Foundation

//class only protocols should now extend AnyObject instead of class: https://useyourloaf.com/blog/class-only-protocols-in-swift-4/
protocol PlacesView: AnyObject {
    
    func showError(title: String, message: String)
    
}
