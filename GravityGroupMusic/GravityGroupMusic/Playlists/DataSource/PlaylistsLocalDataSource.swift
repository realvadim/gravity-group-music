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
    
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void) {
        guard let jsonFilePath = Bundle.main.path(forResource: "playlistsLocalDataSource", ofType: "json") else {
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFilePath), options: []) else {
            return
        }
        
        do {
            let playlistsDataSerialized = try JSONDecoder().decode([Playlist].self, from: data)
            DispatchQueue.main.async {
                completion(playlistsDataSerialized, nil)
            }
        } catch let error {
            print(error.localizedDescription)
            
            DispatchQueue.main.async {
                completion(nil, error)
            }
        }
    }
}
