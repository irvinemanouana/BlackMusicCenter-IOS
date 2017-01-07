//
//  BMCAudioPlayerTests.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import XCTest
@testable import BlackMusicCenter

class BMCAudioPlayerTests: XCTestCase {
    
    let musicWeb: BMCWebManager = BMCWebManager.shared;
    
    let audioPlayer:BMCAudioPlayer = BMCAudioPlayer.shared;
    
    var music:BMCMusic!
    
    override func setUp() {
        super.setUp()
        
        let id:String = "58705cc8f0023f2e5873f525";
        self.music = BMCMusic(id: id, title: "title", artist: "artist", genre: "genre", thumbnail: "thumbnail");
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPlayMusic() {
        XCTAssertFalse(self.audioPlayer.isReady);
        self.musicWeb.downloadMusic(self.music)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async(execute: {
                        self.audioPlayer.play(data);
                        XCTAssertTrue(self.audioPlayer.isReady);
                        XCTAssertTrue(self.audioPlayer.isPlaying);
                    })
                case .failure:
                    XCTFail()
                }
        }
    }
    
    func testPauseMusic() {
        XCTAssertFalse(self.audioPlayer.isReady);
        self.musicWeb.downloadMusic(self.music)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async(execute: {
                        self.audioPlayer.play(data);
                        self.audioPlayer.pause();
                        XCTAssertTrue(self.audioPlayer.isReady);
                        XCTAssertFalse(self.audioPlayer.isPlaying);
                    })
                case .failure:
                    XCTFail()
                }
        }
    }
}
