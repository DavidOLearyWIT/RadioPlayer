//
//  RadioPlayer.swift
//  MusicPlayer
//
//  Created by David O'Leary on 20/11/2015.
//  Based upon iOS Creator tutorial on playing audio http://www.ioscreator.com/tutorials/play-music-avaudioplayer-ios8-swift
//  Copyright © 2015 David O'Leary. All rights reserved.
//

//Import of libraries
import Foundation
import AVFoundation

//Class builder
class RadioPlayer {
    
    //Creating an instance of the RadioPlayer. Access from viewcontroller
    static let sharedInstance = RadioPlayer()
    
    //Setting the default radio stream
    var player = AVPlayer(URL: NSURL(string: "http://s22.myradiostream.com:9368/")!)
    
    //Setting the player to not play when loaded
    var isPlaying = false
    
    //Play the stream when function called
    func play() {
        player.play()
        isPlaying = true
    }
    
    //Pause the stream when function called
    func pause() {
        player.pause()
        isPlaying = false
    }
    
    //Toggle for checking whether isPlaying is currently true or false 
    //and then pausing or playing based on status
    func toggle() {
        if isPlaying == true {
            pause()
        } else {
            play()
        }
    }
    
    //Return of isPlaying status
    func currentlyPlaying() -> Bool {
        return isPlaying
    }
    
}

