//
//  ApiClient.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/21/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

protocol ApiClient: AnyObject {
    /// Executes the request.
    ///
    /// - Parameters:
    ///   - request: Request to execute.
    ///   - completion: Completion block is invoked with either data or error.
    /// - Returns: URLSessionTask object, which can be manipulated by the client.
    func execute(request: NetworkRequest,
                 completion: (Data?, Error?) -> Void) -> URLSessionTask
}
