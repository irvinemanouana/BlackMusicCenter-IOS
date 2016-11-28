//
//  BMCMusic.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 16/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import Foundation


class BMCMusic : NSObject {
    
    let id:String!
    
    let title:String!
    
    let artist:String!
    
    let genre:String!
    
    let thumbnail:String!
    
    init(id: String, title: String, artist:String, genre:String, thumbnail:String) {
        let web:BMCWebManager = BMCWebManager.shared;
        self.id = id;
        self.title = title;
        self.artist = artist;
        self.genre = genre;
        self.thumbnail = "http://\(web.url)\(thumbnail)";
    }
}
