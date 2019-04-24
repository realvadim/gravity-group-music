//
//  NowPlayingContainerViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/11/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class NowPlayingContainerViewController: UIViewController {
    @IBOutlet private var contentView: UIView!
    
    private var oneSongViewController: OneSongViewController!
    private var playlistSongsViewController: PlaylistSongsViewController!
    
    // it was meant to be set, when user opens this screen (for example in prepareForSegue)
    // playlistId would allow to load songs of a particular playlist.
    var playlistId: Int = 1
    
    // For now we get the data from a local JSON file.
    // this can be easily switched to another implementation of the protocol.
    // Another example of the implementation of this protocol (which uses network module) is in FMAAttempt branch of this repo.
    private var playlistSongsDataSource: PlaylistSongsDataSource = PlaylistSongsLocalDataSource()
    private var playbackState: PlaybackState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOW PLAYING"
        loadSongs()
        subscribeToNotifications()
    }
    
    private func loadSongs() {
        playlistSongsDataSource.getPlaylistSongs(forPlaylistId: playlistId) {[weak self] (songs, error) in
            guard let songs = songs, songs.count > 0 else { return }
            
            self?.playbackState = PlaybackState(currentPlaybackStateType: .notPlaying, songs: songs)
            self?.setupChildViewControllers()
        }
    }

    private func setupChildViewControllers() {
        oneSongViewController = OneSongViewController()
        add(oneSongViewController, toViewHolder: contentView)
        oneSongViewController.currentState = playbackState
        playbackState.register(listener: oneSongViewController)
        
        playlistSongsViewController = PlaylistSongsViewController()
        playlistSongsViewController.currentPlaybackState = playbackState
        add(playlistSongsViewController, toViewHolder: contentView)
        playbackState.register(listener: playlistSongsViewController)
        
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
                                               name: NSNotification.Name(rawValue: "ToggleSong"),
                                               object: nil)
    }
    
    @objc private func PlaybackStateUpdateRequested(notification: Notification) {
        guard let newSong = notification.userInfo?["song"] as? Song else {
            return
        }
        
        playbackState.toggle(toSong: newSong)
    }
}
