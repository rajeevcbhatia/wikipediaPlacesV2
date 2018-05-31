//
//  UIApplicationURLHandlingProtocol.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 31/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import UIKit

/** to test the open and canOpenURL methods */
protocol UIApplicationURLHandlingProtocol {
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Void)?)
    func canOpenURL(_ url: URL) -> Bool
}

extension UIApplication: UIApplicationURLHandlingProtocol { }
