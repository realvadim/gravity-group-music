//
//  MoodsCollectionViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Screen that displays the list of moods.
class MoodsCollectionViewController: UICollectionViewController {
    
    private let cellReuseId = "musicmoodcell"
    private let names = ["EDM", "CHILL", "PARTY", "EVERGREEN", "WORKOUT", "ROMANTIC"]

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    private func registerCell() {
        let cellNib = UINib(nibName: String(describing: MusicMoodCollectionViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellReuseId)
    }

    // MARK: - UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! MusicMoodCollectionViewCell
        let stubImage = UIImage(named: "party")!
        cell.configure(with: stubImage, title: names[indexPath.row])
    
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MoodsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height: CGFloat = 136
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
