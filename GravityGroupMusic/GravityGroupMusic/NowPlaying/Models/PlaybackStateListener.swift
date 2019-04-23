//
//  PlaybackStateListener.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/23/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Protocol for objects that observe player playback state.
protocol PlaybackStateListener {
    func playbackStateChanged(to: PlaybackStateType)
}
