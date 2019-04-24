//
//  PlaylistSongsLocalDataSource.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/22/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Implementation of PlaylistSongsDataSource protocol.
///
/// Returns an array of songs from a local JSON file (ignores playlistId).
class PlaylistSongsLocalDataSource: PlaylistSongsDataSource {
    func getPlaylistSongs(forPlaylistId playlistId: Int,
                          completion: @escaping ([Song]?, Error?) -> Void) {
        guard let jsonFilePath = Bundle.main.path(forResource: "playlistSongsLocalDataSource",
                                                  ofType: "json") else { return }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath),
                                   options: []) else { return }
        
        do {
            let songsDataSerialized = try JSONDecoder().decode([Song].self, from: data)
            DispatchQueue.main.async {
                completion(songsDataSerialized, nil)
            }
        } catch let error {
            DispatchQueue.main.async {
                completion(nil, error)
            }
        }
    }
}
