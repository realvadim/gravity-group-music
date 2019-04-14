//
//  Playlist.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Playlist model
class Playlist {
    
    /// Name of the Playlist.
    let name: String
    
    /// Playlist cover image name.
    let coverImageName: String
    
    init(name: String, coverImageName: String) {
        self.name = name
        self.coverImageName = coverImageName
    }
}
