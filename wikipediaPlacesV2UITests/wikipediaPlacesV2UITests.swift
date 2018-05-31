//
//  wikipediaPlacesV2UITests.swift
//  wikipediaPlacesV2UITests
//
//  Created by Rajeev Bhatia on 29/05/2018.
//  Copyright © 2018 rajeevcbhatia. All rights reserved.
//

import XCTest

class wikipediaPlacesV2UITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPlacesAreShown() {
        XCTAssert(app.tables.firstMatch.cells.count > 0, "no places visible for the user")
    }
    
}
