//
//  PlaylistCollectionViewCell.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit
import Kingfisher

/// Cell that displays a cover for a playlist.
class PlaylistCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var playlistImageView: UIImageView!
    @IBOutlet private var playlistTitleLabel: UILabel!
    
    /// Configures the cell with the title and url of the image to be displayed.
    ///
    /// - Parameters:
    ///   - imageUrlString: Playlist cover image URL.
    ///   - title: Playlist name.
    func configure(withImageUrlString imageUrlString: URL, title: String) {
        playlistImageView.kf.indicatorType = .activity
        playlistImageView.kf.setImage(with: ImageResource(downloadURL: imageUrlString))
        playlistTitleLabel.text = title
    }
}
