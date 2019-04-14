//
//  PlaylistCollectionViewCell.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Cell that displays a cover for a playlist.
class PlaylistCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var playlistImageView: UIImageView!
    @IBOutlet private var playlistTitleLabel: UILabel!
    
    /// Congures the cell with data to be displayed.
    ///
    /// - Parameters:
    ///   - image: Cover image.
    ///   - title: Playlist name.
    func configure(with image: UIImage?, title: String) {
        playlistImageView.image = image
        playlistTitleLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
