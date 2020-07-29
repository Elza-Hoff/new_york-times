//
//  APICachableResponse.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Marshal

@objc protocol APICachableEndpoint {
    
    var cacheTime: NSNumber? { get }
    
}

protocol APICachableResponse {
    
    var result: MarshaledObject { set get }
    
}

