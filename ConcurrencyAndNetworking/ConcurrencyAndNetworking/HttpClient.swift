//
//  HttpClient.swift
//  ConcurrencyAndNetworking
//
//  Created by Carla on 04/11/2018.
//  Copyright © 2018 Carla. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
}

extension URLSession: URLSessionProtocol {
}

    
class HttpClient {
    typealias completeClosure = ( _ data: Data?, _ error: Error?)-> Void
    private let session: URLSessionProtocol
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func get(url: URL, callback: @escaping completeClosure ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        if let urlSession = session as? URLSession {
            let task = urlSession.dataTask(with: request) { (data, response, error) in
                callback(data, error)
            }
            task.resume()
        }
    }
    
}
