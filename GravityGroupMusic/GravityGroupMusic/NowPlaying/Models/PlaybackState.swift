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
    case notPlaying(song: Song)
    case paused(song: Song)
    case playing(song: Song)
    
    var associatedValue: Song {
        switch self {
        case .notPlaying(let song):
            return song
        case .paused(let song):
            return song
        case .playing(let song):
            return song
        }
    }
}

/// Encapsulates player playback state. Notifies listeners when state is changed.
class PlaybackState {
    var playbackStateType: PlaybackStateType {
        didSet {
            notifyListeners()
        }
    }
    
    private var listeners = [PlaybackStateListener]()
    
    init(playbackStateType: PlaybackStateType) {
        self.playbackStateType = playbackStateType
    }
    
    /// Registers a listener.
    ///
    /// - Parameter listener: an object that should be notified when the playback state changes.
    func register(listener: PlaybackStateListener) {
        listeners.append(listener)
    }
    
    private func notifyListeners() {
        listeners.forEach {
            $0.playbackStateChanged(to: playbackStateType)
        }
    }
}
