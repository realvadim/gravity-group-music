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

    /// Configures the cell with song number and name to display.
    ///
    /// - Parameters:
    ///   - sequenceNumber: Song sequence number.
    ///   - songName: Song name.
    func configure(withSequenceNumber sequenceNumber: Int, songName: String) {
        numberLabel.text = "\(sequenceNumber)"
        songNameLabel.text = "\(songName)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func playButtonPressed(_ sender: PlayButton) {
        // TODO implement the method
    }
}
