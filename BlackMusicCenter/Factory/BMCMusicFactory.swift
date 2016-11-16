//
//  BMCMusicFactory.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 16/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import Foundation


class BMCMusicFactory : NSObject {
    
    class func getMusicFromJSON(_ data: [String:AnyObject]) -> BMCMusic {
        let title:String = data["title"] as! String;
        return BMCMusic(title: title);
    }
    
}
