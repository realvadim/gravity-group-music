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

class OneSongViewController: UIViewController, PlaybackStateListener {

    private let player = Player()
    var currentState: PlaybackState!
    
    @IBOutlet private var songNameLabel: UILabel!
    @IBOutlet private var performerNameLabel: UILabel!
    @IBOutlet private var songCoverImageView: UIImageView!
    @IBOutlet private var playPauseButton: PlayButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAudioSession()
        UIApplication.shared.beginReceivingRemoteControlEvents()
        becomeFirstResponder()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: - PlaybackStateListener
    
    func playbackStateChanged(to newPlaybackState: PlaybackState) {
        switch newPlaybackState.currentPlaybackStateType {
        case .notPlaying:
            playPauseButton.playingState = .notPlaying
            player.pauseAudio()
        case .playing:
            playPauseButton.playingState = .playing
            // если та же самая, продолжи. Иначе playStream
            if currentState.currentSong == newPlaybackState.currentSong {
                player.playStream(from: URL(string: newPlaybackState.currentSong.playbackFileUrl)!)
                player.playAudio()
            } else {
                player.playStream(from: URL(string: newPlaybackState.currentSong.playbackFileUrl)!)
                player.playAudio()
            }
        }
        
        currentState = newPlaybackState
        updateInterface()
        updateRemoteControl()
    }
    
    private func setAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true, options: [])
        } catch {
            print(error)
        }
    }
    
    private func updateInterface() {
        
        songNameLabel.text = currentState.currentSong.name
        performerNameLabel.text = currentState.currentSong.performerName
        playPauseButton.playingState = currentState.currentPlaybackStateType == .playing ? .playing : .notPlaying;
        
        
        let coverImageUrl = URL(string: currentState.currentSong.coverImageUrl)!
        songCoverImageView.kf.indicatorType = .activity
        songCoverImageView.kf.setImage(with: ImageResource(downloadURL: coverImageUrl))
    }
    
    // MARK: - Remote Controls
    
    private func updateRemoteControl() {
        
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: currentState.currentSong.name,
            MPMediaItemPropertyArtist: currentState.currentSong.performerName
        ]
        
        MPRemoteCommandCenter.shared().playCommand.isEnabled = true
        MPRemoteCommandCenter.shared().playCommand.addTarget(self, action: #selector(play))
        
        MPRemoteCommandCenter.shared().pauseCommand.isEnabled = true
        MPRemoteCommandCenter.shared().pauseCommand.addTarget(self, action: #selector(pause))
    }
    
    // MARK: - IBActions
    
    @IBAction private func previousTrackButtonTapped(_ sender: UIButton) {
        currentState.goToPreviousTrack()
    }
    
    @IBAction private func playPauseButtonTapped(_ sender: PlayButton) {
        currentState.toggle(toSong: currentState.currentSong)
    }
    
    @IBAction private func nextTrackButtonTapped(_ sender: UIButton) {
        currentState.goToNextTrack()
    }
    
    // MARK: - Player
    
    @objc func play() {
        player.playAudio()
    }
    
    @objc func pause() {
        player.pauseAudio()
    }
}
