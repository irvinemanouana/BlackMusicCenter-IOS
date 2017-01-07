//
//  BMCUIImagTests.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import XCTest
@testable import BlackMusicCenter

class BMCUIImagTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUIImageFromURLSuccess() {
        let url:String = "https://www.google.fr/images/branding/googlelogo/2x/googlelogo_dark_color_272x92dp.png";
        XCTAssertNotNil(UIImage.fromURL(url: URL(string: url)!));
    }
    
    func testUIImageFromURLBad() {
        XCTAssertNil(UIImage.fromURL(url: URL(string: "https://www.google.fr")!));
    }
}
