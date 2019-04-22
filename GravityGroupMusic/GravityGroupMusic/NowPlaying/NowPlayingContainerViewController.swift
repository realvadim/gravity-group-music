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
    
    var playlistId: Int = 1
    private var playlistSongsDataSource: PlaylistSongsDataSource = PlaylistSongsLocalDataSource()
    private var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOW PLAYING"
        loadSongs()
        setupChildViewControllers()
    }
    
    private func loadSongs() {
        playlistSongsDataSource.getPlaylistSongs(forPlaylistId: playlistId) {[weak self] (songs, error) in
            guard let songs = songs else { return }
            
            self?.songs = songs
            self?.playlistSongsViewController.songs = songs
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
}

