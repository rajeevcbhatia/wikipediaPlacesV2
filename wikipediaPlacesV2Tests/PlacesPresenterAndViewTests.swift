//
//  PlacesPresenterTests.swift
//  wikipediaPlacesV2Tests
//
//  Created by Rajeev Bhatia on 31/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import XCTest
@testable import wikipediaPlacesV2

class PlacesPresenterAndViewTests: XCTestCase {
    
    
    func testPlaceSelection() {
        
        let mockApplication = MockApplication()
        
        let presenter = PlacesPresenter.init(placesView: nil, application: mockApplication)
        
        
        XCTAssertFalse(mockApplication.hasCalledCanOpenURL)
        XCTAssertFalse(mockApplication.hasCalledOpenedURL)
        presenter.didSelectRowAt(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockApplication.hasCalledCanOpenURL)
        XCTAssertTrue(mockApplication.hasCalledCanOpenURL)
    }
    
    func testPlaceCount() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let placesListVC = storyboard.instantiateViewController(withIdentifier: "PlacesListViewController") as? PlacesListViewController else {
            XCTFail("could not init places vc")
            return
        }
        
        _ = placesListVC.view // To call viewDidLoad
        
        let tableView = placesListVC.tableView
        let cellCount = tableView?.numberOfRows(inSection: 0)
        
        XCTAssertEqual(cellCount, PlaceProvider.defaultPlaces?.count, "table does not have same number of cells as default places")
        
    }
}


class MockApplication: UIApplicationURLHandlingProtocol {
    var hasCalledCanOpenURL = false
    func canOpenURL(_ url: URL) -> Bool {
        hasCalledCanOpenURL = true
        return true
    }
    
    var hasCalledOpenedURL = false
    func open(_ url: URL, options: [String : Any], completionHandler completion: ((Bool) -> Void)?) {
        hasCalledOpenedURL = true
    }
}
