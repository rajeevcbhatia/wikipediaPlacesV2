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
    
    //TODO: if the app is tested without pressing the "Open wikipedia" system alert, this test will fail. app.alerts is empty when the alert is shown
    func testTableTap() {
        
        let cell = app.tables.firstMatch.cells.firstMatch
        cell.tap()
        
//        if app.alerts.count > 0 { //the first time, the app might be showing the "open in wikipedia" alert
//            app.alerts.firstMatch.buttons.firstMatch.tap()
//        }
        let waitForBg = app.wait(for: .runningBackground, timeout: 10.0)
        XCTAssertTrue(waitForBg, "app Did Not go to background")
    }
    
    func testMapOpen() {
        
        app.navigationBars.buttons.firstMatch.tap()
        
        XCTAssertTrue(app.maps.count > 0 , "map was not shown")
        
    }
    
}
