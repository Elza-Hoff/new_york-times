//
//  APIError.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

enum APIError: Error {
    case tokenExpired
    case invalidCredentials(errorDescription: APIErrorDescription?)
    case conflictRequest(errorDescription: APIErrorDescription?)
    case notAcceptable(errorDescription: APIErrorDescription?)
    case invalidResponse
    case badRequest(errorDescription: APIErrorDescription?)
    case unprocessableEntity(errorDescription: APIErrorDescription?)
    case server(errorDescription: APIErrorDescription?)
    case incorrectRequest(errorCode: Int, errorDescription: APIErrorDescription?)
    case noInternet
    case objectNotFound(errorDescription: APIErrorDescription?)
    case cancelledRequest
}

func ErrorValidator(error: Error) -> APIError {
    if error is APIError {
        return error as! APIError
    }
    if (error as NSError).code == NSURLErrorNotConnectedToInternet {
        return APIError.noInternet
    }
    if (error as NSError).code == NSURLErrorCancelled {
        return APIError.cancelledRequest
    }
    return APIError.server(errorDescription: nil)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .incorrectRequest(_, let errorDescription),
             .notAcceptable(let errorDescription),
             .unprocessableEntity(let errorDescription),
             .invalidCredentials(let errorDescription),
             .conflictRequest(let errorDescription),
             .badRequest(let errorDescription):
            return errorDescription?.text
        case .cancelledRequest:
            return "Cancelled request"
        case .noInternet:
            return "No internet connection"
        case .objectNotFound(let errorDescription):
            return errorDescription?.text ?? "Object has been deleted"
        case .server(let errorDescription):
            return errorDescription?.text ?? "Server error"
        default:
            return "Server error"
        }
    }
}
