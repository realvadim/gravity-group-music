//
//  SongTableViewCell.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/15/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Cell for a song of a playlist.
class SongTableViewCell: UITableViewCell {

    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var songNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func playButtonPressed(_ sender: PlayButton) {
        // TODO implement the method
    }
}
