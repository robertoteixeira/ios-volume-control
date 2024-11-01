//
//  VolumeControlUITests.swift
//  VolumeControlUITests
//
//  Created by Roberto Teixeira on 31/10/2024.
//

import XCTest

class VolumeControlUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testSetProgressAndBars() {
        // Test setting progress
        let progressTextField = app.textFields["Volume (0 to 100)"]
        clearAndEnterText(textField: progressTextField, text: "10")
        
        let setProgressButton = app.buttons["Set Volume"]
        setProgressButton.tap()
        
        // Check that the slider updates
        XCTAssertTrue(app.staticTexts["Current volume: 10.0%"].exists)

        // Test setting number of bars
        let barsTextField = app.textFields["Number of Bars"]
        clearAndEnterText(textField: barsTextField, text: "15")
        
        let setBarsButton = app.buttons["Set Bars"]
        setBarsButton.tap()
        
        // Check that an error message does not exist
        XCTAssertFalse(app.staticTexts["Bar count must be between 4 and 30."].exists)
    }
    
    private func clearAndEnterText(textField: XCUIElement, text: String) {
        textField.tap()
        
        // Select all text if any exists, and delete
        if let currentValue = textField.value as? String, !currentValue.isEmpty {
            textField.doubleTap()
        }
        
        textField.typeText(text)
    }
}

