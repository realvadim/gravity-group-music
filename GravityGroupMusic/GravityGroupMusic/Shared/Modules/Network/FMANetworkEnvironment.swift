//
//  FMANetworkEnvironment.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Environment for performing requests to Free Music Archive API.
class FMANetworkEnvironment: NetworkEnvironment {
    var host: String = "https://freemusicarchive.org"
    
    var defaultHeaders: [String: String]? {
        return ["Accept": "application/json"]
    }
    
    var defaultParameters: [String: String]? {
        return ["api_key": "2RYX9MW0RSIPYNPI"]
    }
}
