//
//  SelfSizingTableView.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/19/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// TableView that can calculate its intrinsicContentSize based on contentSize
class SelfSizingTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.size != intrinsicContentSize {
            invalidateIntrinsicContentSize()
        }
    }
}
