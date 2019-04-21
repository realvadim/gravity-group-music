//
//  PlaylistsCollectionViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Screen that displays playlists.
class PlaylistsCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private var playlistsDataSource: PlaylistsDataSource = PlaylistsLocalDataSource()
    //private var playlistsDataSource: PlaylistsDataSource = PlaylistsFMADataSource()
    
    private var playlists = [Playlist]()
    private let sectionHeaderReuseId = "titleHeader"

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PLAYLISTS"
        registerNibs()
        loadPlaylists()
    }
    
    private func registerNibs() {
        let cellNib = UINib(nibName: String(describing: PlaylistCollectionViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: String(describing: PlaylistCollectionViewCell.self))
        
        collectionView.register(UICollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: sectionHeaderReuseId)
    }
    
    // MARK: - Private Methods
    
    private func loadPlaylists() {
        playlistsDataSource.getAllPlaylists {[weak self] (playlists, error) in
            guard let playlists = playlists else { return }
            
            self?.playlists = playlists
            self?.collectionView.reloadData()
        }
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playlists.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlaylistCollectionViewCell.self),
                                                      for: indexPath) as! PlaylistCollectionViewCell
        let playlist = playlists[indexPath.row]
        cell.configure(with: UIImage(named: playlist.coverImageName), title: playlist.name)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                         withReuseIdentifier: sectionHeaderReuseId,
                                                                         for: indexPath)
        
        let titleHeaderView = TitleHeaderView()
        titleHeaderView.configure(with: "YOU MIGHT LIKE")
        headerView.addSubview(titleHeaderView)
        titleHeaderView.frame = headerView.bounds
        
        return headerView
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlaylistsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 136
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 63)
    }
}
