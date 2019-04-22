//
//  Playlist.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Playlist model.
struct Playlist: Codable {
    /// Playlist database id.
    let id: Int
    
    /// Name of the playlist.
    let name: String
    
    /// Playlist cover image URL.
    let coverImageUrl: String
}
