//
//  APIResponseValidator.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

func APIResponseValidator(request: URLRequest?, response: HTTPURLResponse, data: Data?) -> Request.ValidationResult {
    var errorDescription: APIErrorDescription? = nil
    if let jsonData = data, let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? MarshaledObject {
        errorDescription = try? APIErrorDescription(object: json)
    }
    
    if let description = errorDescription {
        print("errorDescription: \(description)")
    }
    
    switch response.statusCode {
    case 400:
        return .failure(APIError.badRequest(errorDescription: errorDescription))
    case 401:
        return .failure(APIError.invalidCredentials(errorDescription: errorDescription))
    case 403:
        return .failure(APIError.invalidCredentials(errorDescription: errorDescription))
    case 404:
        return .failure(APIError.objectNotFound(errorDescription: errorDescription))
    case 406:
        return .failure(APIError.notAcceptable(errorDescription: errorDescription))
    case 409:
        return .failure(APIError.conflictRequest(errorDescription: errorDescription))
    case 422:
        return .failure(APIError.unprocessableEntity(errorDescription: errorDescription))
    case 400..<500:
        return .failure(APIError.invalidResponse)
    case 500..<Int.max:
        return .failure(APIError.server(errorDescription: errorDescription))
    default:
        break
    }
    return .success
}
