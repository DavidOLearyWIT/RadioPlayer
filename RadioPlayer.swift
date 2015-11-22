//
//  RadioPlayer.swift
//  MusicPlayer
//
//  Created by Shapes on 20/11/2015.
//  Copyright © 2015 Shapes. All rights reserved.
//

import Foundation
import AVFoundation

class RadioPlayer {
    static let sharedInstance = RadioPlayer()
    var player = AVPlayer(URL: NSURL(string: "http://listen.radionomy.com/buddha-bar")!)
    var isPlaying = false
    
    func play() {
        player.play()
        isPlaying = true
    }
    
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
    
}

