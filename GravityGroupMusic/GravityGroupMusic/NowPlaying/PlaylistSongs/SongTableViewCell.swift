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
    @IBOutlet var playPauseButton: PlayButton!
    
    /// Invoked on a press of the play/pause button.
    var onPlayPauseButtonTap: (() -> Void)?

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
        let originalButtonBackgroundColor = playPauseButton.backgroundColor
        
        super.setSelected(selected, animated: animated)

        numberLabel.textColor = selected ? #colorLiteral(red: 0.9882352941, green: 0.3176470588, blue: 0.5215686275, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.49)
        songNameLabel.textColor = selected ? #colorLiteral(red: 0.9882352941, green: 0.3176470588, blue: 0.5215686275, alpha: 1) : #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.49)
        playPauseButton.backgroundColor = originalButtonBackgroundColor
    }
    
    @IBAction private func playButtonPressed(_ sender: PlayButton) {
        onPlayPauseButtonTap?()
    }
}
