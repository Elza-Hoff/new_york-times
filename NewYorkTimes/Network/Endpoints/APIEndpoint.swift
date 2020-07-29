//
//  APIEndpoint.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

protocol APIEndpoint {
    associatedtype ResponseType
    
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: JSONObject? { get}
    var headers: HTTPHeaders { get }
}
