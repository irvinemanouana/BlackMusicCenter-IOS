//
//  BlackMusicCenterUITests.swift
//  BlackMusicCenterUITests
//
//  Created by Nicolas Fonsat on 08/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import XCTest
@testable import BlackMusicCenter

class BlackMusicCenterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPlayMusic() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let buttons = XCUIApplication().buttons;
        XCTAssertEqual(buttons.count, 3);
        
        for button in buttons.allElementsBoundByIndex {
            button.tap();
        }
        
        let table = XCUIApplication().tables.element(boundBy: 0);
        XCTAssertTrue(table.exists);
        
        let cells = table.cells;
        print("Count cells : \(cells.count)");
        for cell in cells.allElementsBoundByIndex {
            XCTAssertEqual(cell.staticTexts.count, 3);
            cell.tap();
        }
    }
}
