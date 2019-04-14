//
//  PlaylistsLocalDataSource.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Implementation of PlaylistsDataSource.
///
/// Return hardcoded playlists collection.
class PlaylistsLocalDataSource: PlaylistsDataSource {
    private let playlists = [Playlist(name: "EDM", coverImageName: "edm"),
                             Playlist(name: "CHILL", coverImageName: "chill"),
                             Playlist(name: "PARTY", coverImageName: "party"),
                             Playlist(name: "EVERGREEN", coverImageName: "evergreen"),
                             Playlist(name: "WORKOUT", coverImageName: "workout"),
                             Playlist(name: "ROMANTIC", coverImageName: "romantic")]
    
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void) {
        completion(playlists, nil)
    }
}
