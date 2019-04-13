//
//  MusicMoodCollectionViewCell.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Cell that displays a cover for a mood of music
class MusicMoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var moodImageView: UIImageView!
    @IBOutlet private var moodTitleLabel: UILabel!
    
    /// Congures the cell with data to be displayed.
    ///
    /// - Parameters:
    ///   - image: Cover image.
    ///   - titlSe: Mood name.
    func configure(with image: UIImage, title: String) {
        moodImageView.image = image
        moodTitleLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
