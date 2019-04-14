//
//  PlaylistsDataSource.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/14/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Protocol for a playlists data source.
protocol PlaylistsDataSource {
    
    /// Gets playlists.
    ///
    /// - Parameter completion: completion block that either accepts array of loaded playlists or error.
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void)
}
