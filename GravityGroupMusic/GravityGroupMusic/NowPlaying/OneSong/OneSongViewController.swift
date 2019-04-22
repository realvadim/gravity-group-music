//
//  OneSongViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit

class OneSongViewController: UIViewController {

    let player = Player()
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var performerNameLabel: UILabel!
    @IBOutlet private var songCoverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://ggmusicstreaming.000webhostapp.com/rock4.mp3"
        let url = URL(string: urlString)!
        player.playStream(from: url)
        player.playAudio()
    }

    @IBAction func playButtonPressed(_ sender: PlayButton) {
        if (sender.playingState == .playing) {
            player.pauseAudio()
            sender.playingState = .notPlaying
        } else {
            player.playAudio()
            sender.playingState = .playing
        }
    }
}
