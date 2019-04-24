//
//  Player.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/21/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation
import MediaPlayer

class Player {
    var avPlayer: AVPlayer!
    
    init() {
        avPlayer = AVPlayer()
    }
    
    func playStream(from url: URL) {
        avPlayer = AVPlayer(url: url)
        avPlayer.play()
    }
    
    func playAudio() {
        if avPlayer.rate == 0 && avPlayer.error == nil { // currently not playing
            // если не сделать эту проверку на error, а ошибка есть, то краш будет.
            
            avPlayer.play()
        }
    }
    
    func pauseAudio() {
        if avPlayer.rate > 0 && avPlayer.error == nil { // currently not playing
            avPlayer.pause()
        }
    }
}
