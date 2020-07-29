//
//  APIClient+SessionConfiguration.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire

extension APIClient {

    var sessionConfiguration: URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        return configuration
    }
    
}
