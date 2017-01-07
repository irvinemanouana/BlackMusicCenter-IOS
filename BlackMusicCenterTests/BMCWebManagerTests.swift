//
//  BMCWebManagerTests.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import BlackMusicCenter

class BMCWebManagerTests: XCTestCase {
    let timeout: TimeInterval = 30.0
    
    var webManager:BMCWebManager!
    
    override func setUp() {
        super.setUp()
        self.webManager = BMCWebManager.shared;
    }
    
    override func tearDown() {
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
    
    func testDownloadMusic() {
        let ex = self.expectation(description: "Expecting a JSON data not nil")
        
        var progressDownload:Progress? = nil;
        
        let id:String = "58705cc8f0023f2e5873f525";
        let musicTest = BMCMusic(id: id, title: "title", artist: "artist", genre: "genre", thumbnail: "thumbnail");
        
        self.webManager.downloadMusic(musicTest)
            .downloadProgress { (progress) in
                progressDownload = progress;
            }
            .responseJSON { (response) in
                XCTAssertNotNil(response.result);
                ex.fulfill()
        }
        
        waitForExpectations(timeout: timeout) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
        
        XCTAssertEqual(progressDownload?.fractionCompleted, 1);
    }
    
}
