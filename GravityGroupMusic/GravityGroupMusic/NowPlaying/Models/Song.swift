//
//  Song.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/22/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Song model.
struct Song: Codable {
    /// Song database id.
    let id: Int
    
    /// Song name.
    let name: String
    
    /// Artist/Band name.
    let performerName: String
    
    /// Song cover image URL.
    let coverImageUrl: String
    
    /// Playback file URL.
    let playbackFileUrl: String
    
    /// Playlist database id.
    let playlistId: Int
    
    static func ==(lhs: Song, rhs: Song) -> Bool {
        return lhs.id == rhs.id
    }
}
