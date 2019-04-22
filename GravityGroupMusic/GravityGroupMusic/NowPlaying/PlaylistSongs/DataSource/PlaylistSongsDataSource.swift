//
//  PlaylistSongsDataSource.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/22/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Protocol for a data source of songs of a playlist.
protocol PlaylistSongsDataSource {
    /// Gets all the songs data of the playlist with given id.
    ///
    /// - Parameters:
    ///   - playlistId: playlist database id.
    ///   - completion: completion block that either accepts array of loaded songs or error.
    func getPlaylistSongs(forPlaylistId playlistId: Int,
                          completion: @escaping ([Song]?, Error?) -> Void)
}
