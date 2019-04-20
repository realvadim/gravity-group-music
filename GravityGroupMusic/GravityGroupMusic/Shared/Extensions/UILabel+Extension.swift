//
//  UILabel+Extension.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// Changes attributted text of a label.
    ///
    /// - Parameters:
    ///   - text: New text.
    ///   - shouldKeepCurrentAttributes: attributes already set will be kept.
    ///   - additionalAttributes: additional attributes for the text.
    func replaceAttributedText(with text: String,
                               keepingCurrentAttributes shouldKeepCurrentAttributes: Bool = true,
                               addingMoreAttributes additionalAttributes: [NSAttributedString.Key: Any]? = nil) {
        let attributedText = NSMutableAttributedString(string: text)
        
        let range = NSRange(location: 0, length: text.count)
        
        if let existingAttributes = self.attributedText?.attributes(at: 0, effectiveRange: nil),
            shouldKeepCurrentAttributes {
            attributedText.addAttributes(existingAttributes, range: range)
        }
        
        if let additionalAttributes = additionalAttributes {
            attributedText.addAttributes(additionalAttributes, range: range)
        }
        
        self.attributedText = attributedText
    }
}
