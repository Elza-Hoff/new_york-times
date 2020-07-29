//
//  NetworkHandling.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire

enum State {
    case loading(Bool, RequestType)
    case finish(Bool, RequestType)
    case success(RequestType)
    case failure(APIError, RequestType)
    case cancelled(RequestType)
    case none
}

protocol NetworkHandlingProtocol: class {
    var delegate: NetworkStateProtocol? { get set }
    
    func startRequest(with request: DataRequest, type: RequestType)
    func finishRequest(type: RequestType)
    func cancelAllRequests()
}

protocol NetworkStateProtocol: class {
    
    var state: State { get set }
    
    func update(newState: State)
    
}
