//
//  GetAlbumsRequest.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

class GetAlbumsRequest: NetworkRequest {
    var path: String = "/api/get/albums.json"
    
    var headers: [String: String]? = nil
    
    var parameters: [String: String]? = ["curator_handle": "wfmu"]
}
