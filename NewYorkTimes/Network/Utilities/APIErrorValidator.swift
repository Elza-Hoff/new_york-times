//
//  APIErrorValidator.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

func APIErrorValidator(_ error: Error) -> APIError {
    if error is APIError {
        return error as! APIError
    }
    if (error as NSError).code == NSURLErrorCancelled {
        return APIError.cancelledRequest
    }
    if (error as NSError).code == NSURLErrorNotConnectedToInternet {
        return APIError.noInternet
    }
    return APIError.server(errorDescription: nil)
}

