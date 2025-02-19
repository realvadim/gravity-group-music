//
//  PlaybackState.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/23/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Possible states of the player.
///
/// - notPlaying: No song is being played.
/// - playing: Player currently plays a track.
enum PlaybackStateType {
    case notPlaying
    case playing
}

/// Encapsulates player playback state. Notifies listeners when state is changed.
class PlaybackState {
    var currentPlaybackStateType: PlaybackStateType
    
    var songs = [Song]()
    var currentSong: Song
    private var currentSongIndex = 0
    private var listeners = [Listener]()
    
    init(currentPlaybackStateType: PlaybackStateType, songs: [Song]) {
        self.currentPlaybackStateType = currentPlaybackStateType
        self.songs = songs
        self.currentSong = songs.first!
    }
    
    /// Registers a listener.
    ///
    /// - Parameter listener: an object that should be notified when the playback state changes.
    func register(listener: PlaybackStateListener) {
        listeners.append(Listener(listener: listener))
        listener.playbackStateChanged(to: self)
    }
    
    // MARK: - State Modifiers
    
    /// Moves to playing the previous track. Stops playing if it is the first track on the list.
    func goToPreviousTrack() {
        let previousTrackIndex = currentSongIndex - 1
        if previousTrackIndex < 0 {
            currentPlaybackStateType = .notPlaying
            
            return
        }
        
        currentSongIndex = previousTrackIndex
        currentSong = songs[previousTrackIndex]
        notifyListeners()
    }
    
    /// Handles taps on play/pause buttons. Either if it was tapped on the list or on the player itself.
    ///
    /// - Parameter newSong: Track that was tapped.
    func toggle(toSong newSong: Song) {
        switch currentPlaybackStateType {
        case .notPlaying:
            currentPlaybackStateType = .playing
        case .playing:
            currentPlaybackStateType = currentSong == newSong ? .notPlaying : .playing
        }
        
        currentSongIndex = songs.firstIndex { $0 == newSong }!
        currentSong = newSong
        notifyListeners()
    }
    
    /// Moves to playing the next track. Stops playing if it is the last track on the list.
    func goToNextTrack() {
        let nextTrackIndex = currentSongIndex + 1
        if nextTrackIndex >= songs.count {
            currentPlaybackStateType = .notPlaying
            
            return
        }
        
        currentSongIndex = nextTrackIndex
        currentSong = songs[currentSongIndex]
        notifyListeners()
    }
    
    private func notifyListeners() {
        listeners.forEach {
            $0.listener?.playbackStateChanged(to: self)
        }
    }
}

// MARK: - Weakifying Listeners

private extension PlaybackState {
    struct Listener {
        weak var listener: PlaybackStateListener?
    }
}
