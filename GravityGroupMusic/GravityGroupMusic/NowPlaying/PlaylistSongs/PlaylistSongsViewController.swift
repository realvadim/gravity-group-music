//
//  PlaylistSongsViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/17/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class PlaylistSongsViewController: UIViewController, UITableViewDataSource, PlaybackStateListener {

    @IBOutlet private var titleHeaderView: TitleHeaderView!
    @IBOutlet private var songsListTableView: UITableView!
    var currentPlaybackState: PlaybackState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        titleHeaderView.configure(with: "SONGS ON THIS PLAYLIST")
        songsListTableView.reloadData()
    }
    
    private func registerNib() {
        let cellNib = UINib(nibName: String(describing: SongTableViewCell.self), bundle: nil)
        songsListTableView.register(cellNib, forCellReuseIdentifier: String(describing: SongTableViewCell.self))
    }
    
    // MARK: - PlaybackStateListener
    
    func playbackStateChanged(to newPlaybackState: PlaybackState) {
        songsListTableView.reloadData()
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentPlaybackState.songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsListTableView.dequeueReusableCell(withIdentifier: String(describing: SongTableViewCell.self),
                                                          for: indexPath) as! SongTableViewCell
        
        let song = currentPlaybackState.songs[indexPath.row]
        let isCurrentSong = currentPlaybackState.currentSong == song
        cell.configure(withSequenceNumber: indexPath.row + 1, songName: song.name, isCurrentSong: isCurrentSong)
        cell.onPlayPauseButtonTap = {[unowned self] in
            self.currentPlaybackState.toggle(toSong: song)
        }
        
        cell.playPauseButton.playingState = .notPlaying
        if (currentPlaybackState.currentPlaybackStateType == .playing && isCurrentSong) {
            cell.playPauseButton.playingState = .playing
        }
        
        return cell
    }
}

