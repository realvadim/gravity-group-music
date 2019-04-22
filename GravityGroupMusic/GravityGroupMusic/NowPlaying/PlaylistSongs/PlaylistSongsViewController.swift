//
//  PlaylistSongsViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/17/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class PlaylistSongsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet private var titleHeaderView: TitleHeaderView!
    @IBOutlet private var songsListTableView: UITableView!
    var songs: [Song] = [] {
        didSet {
            songsListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        titleHeaderView.configure(with: "SONGS ON THIS PLAYLIST")
    }
    
    private func registerNib() {
        let cellNib = UINib(nibName: String(describing: SongTableViewCell.self), bundle: nil)
        songsListTableView.register(cellNib, forCellReuseIdentifier: String(describing: SongTableViewCell.self))
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
        
        return cell
    }
}

