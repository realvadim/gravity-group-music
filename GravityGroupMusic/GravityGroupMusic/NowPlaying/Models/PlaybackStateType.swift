//
//  PlaybackState.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/23/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// List possible states of the player.
///
/// - standby: No song has been played. The first on is displayed by the player and is ready to be played.
/// - paused: Player is paused. There is a song stopped in the middle.
/// - playing: Player currently plays a track.
enum PlaybackStateType {
    case notPlaying
    case paused(song: Song)
    case playing(song: Song)
}

//class PlaybackState {
//    
//}
