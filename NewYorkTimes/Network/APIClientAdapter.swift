//
//  APIClientAdapter.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation
import Alamofire

class APIClientAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var request = urlRequest
        request.setValue(APIConstants.defaultUserAgent, forHTTPHeaderField: APIHeaders.userAgent.rawValue)
        if let url = request.url?.description {
            var adaptedString = url
            adaptedString.append(".json?api-key=" + APIClient.shared.apiKey)
            if let adapted = URL(string: adaptedString) {
                return URLRequest(url: adapted)
            }
        }
        return request
    }
    
}
