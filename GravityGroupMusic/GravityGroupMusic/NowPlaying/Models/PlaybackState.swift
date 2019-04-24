//
//  PlaybackState.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/23/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// List of possible states of the player.
///
/// - notPlaying: No song is being played.
/// - paused: Player is paused. There is a song stopped in the middle.
/// - playing: Player currently plays a track.
enum PlaybackStateType {
    case notPlaying
    case paused
    case playing
}

/// Encapsulates player playback state. Notifies listeners when state is changed.
class PlaybackState {
    var currentPlaybackStateType: PlaybackStateType
    
    var songs = [Song]()
    var currentSong: Song
    private var listeners = [PlaybackStateListener]()
    
    init(currentPlaybackStateType: PlaybackStateType, songs: [Song]) {
        self.currentPlaybackStateType = currentPlaybackStateType
        self.songs = songs
        self.currentSong = songs.first!
    }
    
    /// Registers a listener.
    ///
    /// - Parameter listener: an object that should be notified when the playback state changes.
    func register(listener: PlaybackStateListener) {
        listeners.append(listener)
        listener.playbackStateChanged(to: self)
    }
    
    func toggle(toSong newSong: Song) {
        switch currentPlaybackStateType {
        case .notPlaying, .paused:
            currentPlaybackStateType = .playing
        case .playing:
            currentPlaybackStateType = currentSong == newSong ? .paused : .playing
        }
        
        currentSong = newSong
        notifyListeners()
    }
    
    private func updateStateToTrack(withId id: Int) {
    }
    
    private func notifyListeners() {
        print("OBSERVER. Notifying all started.")
        listeners.forEach {
            $0.playbackStateChanged(to: self)
        }
    }
}
