//
//  NetworkEnvironment.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Common settings for a set of network requests.
protocol NetworkEnvironment: AnyObject {
    /// Base host URL.
    var host: String { get }
    
    /// Default headers for network requests.
    var defaultHeaders: [String: String]? { get }
    
    /// Default parameters.
    var defaultParameters: [String: String]? { get }
}
