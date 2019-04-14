//
//  PlaylistsCollectionViewHeader.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Custom view to be used as the header of PlaylistsCollectionView.
class PlaylistsCollectionViewHeader: UICollectionReusableView {
    @IBOutlet private var titleLabel: UILabel!
    
    /// Configures the view with title text.
    ///
    /// - Parameter title: Text for title.
    func configure(with title: String) {
        titleLabel.text = title
    }
}
