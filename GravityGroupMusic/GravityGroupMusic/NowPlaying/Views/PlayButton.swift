//
//  PlayButton.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

/// Describes possible states for a Play Button.
///
/// - playing: Currently song is being played. Pause image displayed.
/// - notPlaying: No song is being played. Play image displayed.
enum PlayButtonState {
    case playing
    case notPlaying
}

/// Play button. It can be in two states: playing and not playing.
class PlayButton: UIButton {
    
    // MARK: - Properties
    
    var playingState: PlayButtonState = .notPlaying {
        didSet {
            updateButtonImage()
        }
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        playingState = .notPlaying
    }
    
    // MARK: - Private
    
    private func updateButtonImage() {
        let imageName = playingState == .playing ? "pause_button" : "play_button"
        setImage(UIImage(named: imageName), for: .normal)
    }
}
