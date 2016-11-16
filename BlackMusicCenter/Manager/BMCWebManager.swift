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
    private let ip = "192.168.1.76";
    private let port = "3000";
    
    static let shared : BMCWebManager = {
        let instance = BMCWebManager();
        return instance;
    }()
    
    public func getMusicList() -> DataRequest {
        
        let url = "http://\(self.ip):\(self.port)/api/audio/all";
        return self.execute(url);
    
    }
    
    public func downloadMusic(_ music: BMCMusic) -> DownloadRequest {
        let url = "http://\(self.ip):\(self.port)/api/audio/\(music.id!)";
        return download(url);
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
