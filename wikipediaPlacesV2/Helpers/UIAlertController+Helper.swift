//
//  UIAlertController+Helper.swift
//  wikipediaPlacesV2
//
//  Created by Rajeev Bhatia on 30/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func alertWithOKButton(title
        : String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButtonTitle = NSLocalizedString("OK", comment: "OK buttone title")
        let OKAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alertController.addAction(OKAction)
        
        return alertController
    }
}
