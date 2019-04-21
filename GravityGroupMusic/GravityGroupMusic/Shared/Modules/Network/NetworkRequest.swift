//
//  NetworkRequest.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/20/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Класс для создания пользовательского запроса необходимо сабклассить и переопредлять геттеры для свойств.
protocol NetworkRequest: AnyObject {
    /// Path to the endpoint.
    /// Must start with "/", i.e. /api/users
    var path: String { get }
    
    /// Request headers.
    var headers: [String: String]? { get }
    
    /// Request parameters.
    var parameters: [String: String]? { get }
}
