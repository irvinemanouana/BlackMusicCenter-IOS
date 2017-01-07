//
//  BMCMusicFactoryTests.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import BlackMusicCenter

class BMCMusicFactoryTests: XCTestCase {
    
    var jsonObject:JSON = [:];
    
    override func setUp() {
        super.setUp()
        
        jsonObject["_id"] = "58705cc8f0023f2e5873f525";
        jsonObject["createdAt"] = "2017-01-07T03:13:12.942Z";
        jsonObject["updatedAt"] = "2017-01-07T03:15:47.889Z";
        jsonObject["title"]     = "title";
        jsonObject["artist"]    = "artist";
        jsonObject["genre"]     = "genre";
        jsonObject["__v"]       = 0;
        jsonObject["audio"]     = "/upload/audio/music.mp3";
        jsonObject["thumbnail"] = "/upload/thumbnail/thumbnail.jpg";
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetMusicFromJSON() {
        let music:BMCMusic = BMCMusicFactory.getMusicFromJSON(self.jsonObject.object as! [String : AnyObject]);
        XCTAssertNotNil(music);
        XCTAssertEqual(music.id, "58705cc8f0023f2e5873f525");
        XCTAssertEqual(music.title, "title");
        XCTAssertEqual(music.artist, "artist");
        XCTAssertEqual(music.genre, "genre");
    }
    
}
