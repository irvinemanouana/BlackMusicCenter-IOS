//
//  BMCWebManager.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 13/11/2016.
//  Copyright © 2016 Manouana. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BMCWebManager {
    private let ip = "178.62.218.193";
    private let port = "80";
    
    //private let ip = "0.0.0.0";
    //private let port = "3000";
    
    static let shared : BMCWebManager = {
        let instance = BMCWebManager();
        return instance;
    }()
    
    var url:String {
        return "\(self.ip):\(self.port)";
    }
    
    public func getMusicList() -> DataRequest {
        
        let url = "http://\(self.url)/api/audio/all";
        return self.execute(url);
    
    }
    
    public func downloadMusic(_ music: BMCMusic) -> DataRequest {
        let url = "http://\(self.url)/api/audio/\(music.id!)";
        return execute(url);
    }
    
    private func download(_ url: String) -> DownloadRequest {
        print("New download : \(url)");
        return Alamofire.download(url);
    }
    
    private func execute(_ url: String) -> DataRequest {
        print("New request : \(url)");
        return Alamofire.request(url);
    }
}
