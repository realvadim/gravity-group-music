//
//  PlaylistsFMADataSource.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

class PlaylistsFMADataSource: PlaylistsDataSource {
    
    private let apiClient: ApiClient = ApiClientImpl()
    
    func getAllPlaylists(with completion: @escaping ([Playlist]?, Error?) -> Void) {
        let request = GetAlbumsRequest()
        _ = apiClient.execute(request: request) { (data, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(AlbumResponse.self, from: data)
                    
                    let playlists = response.dataset.map({ (album) -> Playlist in
                        return Playlist(name: album.title, coverImageName: "workout")
                    })
                    
                    completion(playlists, nil)
                } catch {
                    completion(nil, error)
                }
                
                return
            }
            
            completion(nil, error)
        }
    }
}
