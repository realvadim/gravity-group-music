//
//  NowPlayingContainerViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/11/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// List possible states of the player.
///
/// - standby: No song has been played. The first on is displayed by the player and is ready to be played.
/// - paused: Player is paused. There is a song stopped in the middle.
/// - playing: Player currently plays a track.
enum PlaybackState {
    case standby
    case paused(song: Song)
    case playing(song: Song)
}

class NowPlayingContainerViewController: UIViewController {
    @IBOutlet private var contentView: UIView!
    
    private var oneSongViewController: OneSongViewController!
    private var playlistSongsViewController: PlaylistSongsViewController!
    
    // it was meant to be set, when user opens this screen (for example in prepareForSegue)
    // playlistId would allow to load songs of a particular playlist.
    var playlistId: Int = 1
    
    // For now we get the data from a local JSON file.
    // this can be easily switched to another implementation of the protocol.
    // Another implementation of this protocol (which uses network module) is in FMAAttempt branch of this repo.
    private var playlistSongsDataSource: PlaylistSongsDataSource = PlaylistSongsLocalDataSource()
    private var songs = [Song]()
    private var playbackState: PlaybackState = .standby
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOW PLAYING"
        loadSongs()
        setupChildViewControllers()
        subscribeToNotifications()
    }
    
    private func loadSongs() {
        playlistSongsDataSource.getPlaylistSongs(forPlaylistId: playlistId) {[weak self] (songs, error) in
            guard let songs = songs else { return }
            
            self?.songs = songs
            self?.playlistSongsViewController.songs = songs
            self?.oneSongViewController.song = songs.first
        }
    }

    private func setupChildViewControllers() {
        oneSongViewController = OneSongViewController()
        add(oneSongViewController, toViewHolder: contentView)
        
        playlistSongsViewController = PlaylistSongsViewController()
        add(playlistSongsViewController, toViewHolder: contentView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let oneSongView: UIView = oneSongViewController.view
        let songsListView: UIView = playlistSongsViewController.view
        
        oneSongView.translatesAutoresizingMaskIntoConstraints = false
        songsListView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["oneSong": oneSongView, "songsList": songsListView]
        var allConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[oneSong]-0-[songsList]-0-|",
                                                            options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[oneSong]-0-|",
                                                         options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[songsList]-0-|",
                                                         options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
    
    // MARK: - Handling Notifications
    
    private func subscribeToNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(PlaybackStateUpdateRequested(notification:)),
                                               name: NSNotification.Name(rawValue: "PlaybackStateUpdateRequested"),
                                               object: nil)
    }
    
    @objc private func PlaybackStateUpdateRequested(notification: Notification) {
        guard let songIndex = notification.userInfo?["songIndex"] as? Int else {
            return
        }
        
        let song = songs[songIndex]
        oneSongViewController.song = song
        
        switch playbackState {
        case .standby:
            let url = URL(string: song.playbackFileUrl)!
            oneSongViewController.player.playStream(from: url)
            playbackState = .playing(song: song)
        case .paused(let currentSong):
            if currentSong.id == song.id {
                oneSongViewController.play()
            } else {
                let url = URL(string: song.playbackFileUrl)!
                oneSongViewController.player.playStream(from: url)
            }
            playbackState = .playing(song: song)
        case .playing(let currentSong):
            if currentSong.id == song.id {
                oneSongViewController.pause()
                playbackState = .paused(song: song)
            } else {
                let url = URL(string: song.playbackFileUrl)!
                oneSongViewController.player.playStream(from: url)
                playbackState = .playing(song: song)
            }
        }
    }
}
