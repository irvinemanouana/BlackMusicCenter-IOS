//
//  BMCUIImage.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import UIKit


extension UIImage {
    
    class func fromURL(url:URL) -> UIImage? {
        do {
            let data = try Data(contentsOf: url);
            return UIImage(data: data);
        }
        catch {
            print(error.localizedDescription);
            return nil;
        }
    }

}
