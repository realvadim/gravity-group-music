//
//  TitleHeaderView.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Custom view to be used as the header of lists.
class TitleHeaderView: UIView {
    @IBOutlet private var titleLabel: UILabel!
    
    /// Configures the view with title text.
    ///
    /// - Parameter title: Text for title.
    func configure(with title: String) {
        let letterSpacingAttributes = [NSAttributedString.Key.kern: 4.59]
        titleLabel.replaceAttributedText(with: title,
                                         addingMoreAttributes: letterSpacingAttributes)
    }
}
