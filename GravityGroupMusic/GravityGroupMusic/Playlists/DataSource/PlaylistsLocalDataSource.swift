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
    private let playlists = [Playlist]()
    
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void) {
        DispatchQueue.main.async {
            completion(self.playlists, nil)
        }
    }
}
