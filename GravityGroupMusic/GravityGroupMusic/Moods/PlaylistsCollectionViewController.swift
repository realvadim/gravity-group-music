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
    
    private let names = ["EDM", "CHILL", "PARTY", "EVERGREEN", "WORKOUT", "ROMANTIC"]

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PLAYLISTS"
        registerCell()
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: String(describing: PlaylistCollectionViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: String(describing: PlaylistCollectionViewCell.self))
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PlaylistCollectionViewCell.self), for: indexPath) as! PlaylistCollectionViewCell
        let stubImage = UIImage(named: "party")!
        cell.configure(with: stubImage, title: names[indexPath.row])
    
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PlaylistsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 136
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
