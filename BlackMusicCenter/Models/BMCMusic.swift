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
    
    init(id: String, title: String) {
        self.id = id;
        self.title = title;
    }
}
