//
//  GravityGroupCollectionViewHeader.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/13/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Custom view to be used in navigation bar throughout the project.
class GravityGroupCollectionViewHeader: UIView {
    @IBOutlet private var titleLabel: UILabel!
    
    /// Configures the view with title text.
    ///
    /// - Parameter title: Text for title.
    func configure(with title: String) {
        titleLabel.text = title
    }
}
