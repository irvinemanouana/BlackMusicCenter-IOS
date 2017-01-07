//
//  BMCAudioPlayer.swift
//  BlackMusicCenter
//
//  Created by Nicolas Fonsat on 07/01/2017.
//  Copyright © 2017 Manouana. All rights reserved.
//

import Foundation
import AVFoundation

class BMCAudioPlayer {
    
    private var player:AVAudioPlayer?
    
    static let shared : BMCAudioPlayer = {
        let instance = BMCAudioPlayer();
        return instance;
    }()
    
    func play(_ data: Data) {
        if let player = try? AVAudioPlayer(data: data) {
            self.player  = player;
            self.play();
        }
    }
    
    func play() {
        if let player = self.player {
            player.play();
            player.numberOfLoops = 1;
            if let duration = self.player?.duration {
                print("Duration : \(duration)");
            }
        }
    }
    
    func pause() {
        if let player = self.player {
            player.pause();
        }
    }
    
    public var isReady: Bool {
        get {
            return self.player != nil;
        }
    }
    
    public var isPlaying: Bool {
        get {
            return self.isReady && (self.player?.isPlaying)!;
        }
    }
}
