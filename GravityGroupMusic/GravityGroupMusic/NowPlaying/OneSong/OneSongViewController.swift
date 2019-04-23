//
//  OneSongViewController.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import UIKit
import MediaPlayer
import Kingfisher

class OneSongViewController: UIViewController {

    let player = Player()
    var song: Song? = nil {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var performerNameLabel: UILabel!
    @IBOutlet private var songCoverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    private func refresh() {
        updateInterface()
        updateRemoteControl()
    }
    
        player.playAudio()
    }

    @IBAction private func playButtonPressed(_ sender: PlayButton) {
        if (sender.playingState == .playing) {
            player.pauseAudio()
            sender.playingState = .notPlaying
        } else {
            player.playAudio()
            sender.playingState = .playing
        }
    }
    
    private func updateInterface() {
        guard let song = song else { return }
        
        songNameLabel.text = song.name
        performerNameLabel.text = song.performerName
        
        let coverImageUrl = URL(string: song.coverImageUrl)!
        songCoverImageView.kf.indicatorType = .activity
        songCoverImageView.kf.setImage(with: ImageResource(downloadURL: coverImageUrl))
    }
    
    // MARK: - Remote Controls
    
    private func updateRemoteControl() {
        guard let song = song else { return }
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: song.name,
            MPMediaItemPropertyArtist: song.performerName
        ]
        
        MPRemoteCommandCenter.shared().playCommand.isEnabled = true
        MPRemoteCommandCenter.shared().playCommand.addTarget(self, action: #selector(play))
        
        MPRemoteCommandCenter.shared().pauseCommand.isEnabled = true
        MPRemoteCommandCenter.shared().pauseCommand.addTarget(self, action: #selector(pause))
    }
    
    // MARK: - Player
    
    @objc func play() {
        player.playAudio()
    }
    
    @objc func pause() {
        player.pauseAudio()
    }
}
