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
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        let viewNib = Bundle.main.loadNibNamed(String(describing: TitleHeaderView.self), owner: self, options: nil)
        let view = viewNib?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    /// Configures the view with title text.
    ///
    /// - Parameter title: Text for title.
    func configure(with title: String) {
        let letterSpacingAttributes = [NSAttributedString.Key.kern: 4.59]
        titleLabel.replaceAttributedText(with: title,
                                         addingMoreAttributes: letterSpacingAttributes)
    }
}
