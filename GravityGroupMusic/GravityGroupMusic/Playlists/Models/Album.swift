//
//  Album.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/21/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

struct AlbumResponse: Codable {
    struct Album: Codable {
        let id: String
        let title: String
        let imageUrl: String
        
        private enum CodingKeys: String, CodingKey {
            case id = "album_id"
            case title = "album_title"
            case imageUrl = "album_image_file"
        }
    }
    
    let dataset: [Album]
}
