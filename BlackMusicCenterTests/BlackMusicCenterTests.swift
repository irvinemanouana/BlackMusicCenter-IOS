//
//  BlackMusicCenterTests.swift
//  BlackMusicCenterTests
//
//  Created by Nicolas Fonsat on 26/12/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import BlackMusicCenter

class BlackMusicCenterTests: XCTestCase {
    
    var webManager:BMCWebManager!
    
    override func setUp() {
        super.setUp()
        self.webManager = BMCWebManager.shared;
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetMusicList() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        self.webManager.getMusicList().responseJSON { (response) in
            XCTAssertNotNil(response.result.value);
            XCTAssertNil(response.result.error)
            let jsonResult = JSON(response.result.value);
            XCTAssertNotNil(jsonResult);
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
