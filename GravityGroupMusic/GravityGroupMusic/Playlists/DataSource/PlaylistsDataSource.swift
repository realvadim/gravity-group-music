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
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void)
}
