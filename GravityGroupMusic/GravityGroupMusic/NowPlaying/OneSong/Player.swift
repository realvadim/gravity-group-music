//
//  Player.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/21/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation
import MediaPlayer

/// Encapsulates the logic of stream playback.
class Player {
    private var avPlayer: AVPlayer!
    private var currentStreamUrlString = ""
    
    init() {
        avPlayer = AVPlayer()
    }
    
    /// Configures player with the url of the stream to play.
    ///
    /// - Parameter streamUrlString: Stream URL string.
    func configure(withStreamUrlString streamUrlString: String) {
        if currentStreamUrlString == streamUrlString {
            return
        }
        
        guard let url = URL(string: streamUrlString) else {
            return
        }
        
        currentStreamUrlString = streamUrlString
        avPlayer = AVPlayer(url: url)
    }
    
    /// Starts playback of the stream.
    func playAudio() {
        if avPlayer.rate == 0 && avPlayer.error == nil {
            avPlayer.play()
        }
    }
    
    /// Suspends playback of the stream.
    func pauseAudio() {
        if avPlayer.rate > 0 && avPlayer.error == nil {
            avPlayer.pause()
        }
    }
}
