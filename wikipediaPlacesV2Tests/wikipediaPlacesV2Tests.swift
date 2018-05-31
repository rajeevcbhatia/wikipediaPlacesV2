//
//  wikipediaPlacesV2Tests.swift
//  wikipediaPlacesV2Tests
//
//  Created by Rajeev Bhatia on 29/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import XCTest
@testable import wikipediaPlacesV2

class wikipediaPlacesV2Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWikipediaBaseURLIsValid() {
        
        XCTAssertNotNil(WikipediaConstants.wikipediaBaseUrl, "wikpedia base url could not be found")
    }
    
    func testCanOpenWikipediaBaseURL() {
        
        guard let wikipediaBaseURL = WikipediaConstants.wikipediaBaseUrl else {
            XCTFail("wikpedia base url could not be found")
            return
        }
        
        XCTAssert(UIApplication.shared.canOpenURL(wikipediaBaseURL), "Wikipedia base URL cannot be opened")
        
    }
    
    func testDefaultPlacesExist() {
        
        let places = PlaceProvider.defaultPlaces
        
        XCTAssertNotNil(places, "default places could not be found")
        
        XCTAssert(places!.count > 0, "zero default places")
        
    }

    func testWikipediaBaseURLForPlace() {
        
        guard let place = PlaceProvider.defaultPlaces?.first else {
            XCTFail("a default place could not be found")
            return
        }
        
        guard let wikipediaURLForPlace = WikipediaConstants.wikipediaUrl(place: place) else {
            XCTFail("could not generate wikipedia url for place")
            return
        }
        
        XCTAssert(UIApplication.shared.canOpenURL(wikipediaURLForPlace), "cannot open wikipedia url")
        
    }
}
