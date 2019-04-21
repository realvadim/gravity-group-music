//
//  ApiClientImpl.swift
//  GravityGroupMusic
//
//  Created by Vadim Miropolskiy on 4/21/19.
//  Copyright © 2019 Gravity Group. All rights reserved.
//

import Foundation

/// Implementation of ApiClient protocol.
class ApiClientImpl: ApiClient {
    
    private let environment: NetworkEnvironment = FMANetworkEnvironment()
    
    func execute(request: NetworkRequest,
                 completion: @escaping (Data?, Error?) -> Void) -> URLSessionTask {
        
        // Request headers
        var allHeaders = [String: String]()
        if let environmentHeaders = environment.defaultHeaders {
            allHeaders = allHeaders.merging(environmentHeaders) { $1 }
        }
        
        if let requestHeaders = request.headers {
            allHeaders = allHeaders.merging(requestHeaders) { $1 }
        }
        
        // Request parameters
        var allQueryItems = [URLQueryItem]()
        if let environmentParameters = environment.defaultParameters {
            environmentParameters.forEach { (key, value) in
                allQueryItems.append(URLQueryItem(name: key, value: value))
            }
        }
        
        if let requestParameters = request.parameters {
            requestParameters.forEach { (key, value) in
                allQueryItems.append(URLQueryItem(name: key, value: value))
            }
        }
        
        // URL formation
        guard var urlComponents = URLComponents(string: environment.host) else {
            preconditionFailure("Invalid host.")
        }
        urlComponents.path = request.path
        urlComponents.queryItems = allQueryItems
        
        guard let url = urlComponents.url else {
            preconditionFailure("Failed to form a URL.")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.allHTTPHeaderFields = allHeaders
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            guard let httpUrlResponse = urlResponse as? HTTPURLResponse else {
                completion(nil, error)
                
                return
            }
            
            httpUrlResponse.statusCode == 200 ? completion(data, nil) : completion(nil, error)
        }
        
        task.resume()
        
        return task
    }
}
