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
    var songs: [Song] = []
    
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
    
    func playbackStateChanged(to newPlaybackStateType: PlaybackStateType) {
        print("OBSERVER. PlaylistSongsVC got notification.")
        let song = newPlaybackStateType.associatedValue
        let index = songs.firstIndex { $0 == song }
        
        let cell = songsListTableView.cellForRow(at: IndexPath(row: index!, section: 0))
        cell?.setSelected(true, animated: true)
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = songsListTableView.dequeueReusableCell(withIdentifier: String(describing: SongTableViewCell.self),
                                                          for: indexPath) as! SongTableViewCell
        
        let song = songs[indexPath.row]
        cell.configure(withSequenceNumber: indexPath.row + 1, songName: song.name)
        cell.requestPlaybackStateUpdate = {[weak self] in
            self?.requestPlaybackStateUpdate(withSongIndex: indexPath.row)
        }
        
        return cell
    }
    
    private func requestPlaybackStateUpdate(withSongIndex index: Int) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlaybackStateUpdateRequested"),
                                        object: nil,
                                        userInfo: ["songIndex": index])
    }
}

