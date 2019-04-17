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
    private var albumSongsListViewController: AlbumSongsListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NOW PLAYING"
        setupChildViewControllers()
    }

    private func setupChildViewControllers() {
        oneSongViewController = OneSongViewController()
        add(oneSongViewController, toViewHolder: contentView)
        
        albumSongsListViewController = AlbumSongsListViewController()
        add(albumSongsListViewController, toViewHolder: contentView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let oneSongView: UIView = oneSongViewController.view
        let songsListView: UIView = albumSongsListViewController.view
        
        oneSongView.translatesAutoresizingMaskIntoConstraints = false
        songsListView.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["oneSong": oneSongView, "songsList": songsListView]
        var allConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[oneSong]-0-[songsList(200)]-0-|",
                                                            options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[oneSong]-0-|",
                                                         options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[songsList]-0-|",
                                                         options: [], metrics: nil, views: views)
        
        NSLayoutConstraint.activate(allConstraints)
    }
}

