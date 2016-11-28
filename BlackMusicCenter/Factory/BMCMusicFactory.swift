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
        let id:String = data["_id"] as! String;
        let title:String = data["title"] as! String;
        let artist:String = data["artist"] as! String;
        let genre:String = data["genre"] as! String;
        let thumbnail:String = data["thumbnail"] as! String;
        return BMCMusic(id: id, title: title, artist: artist, genre: genre, thumbnail: thumbnail);
    }
    
}
