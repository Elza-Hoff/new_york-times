//
//  BaseEndpoint.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

class BaseEndpoint {
    var method: HTTPMethod {
        return .post
    }
    
    init(attributes: Parameters?) {
        self.parameters = attributes
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: JSONObject?
    
    var headers: HTTPHeaders {
        return [
            APIHeaders.contentType.rawValue: APIContentType.applicationJSON.rawValue
        ]
    }
}

//extension BaseEndpoint: APICachableEndpoint {
//    
//    var cacheTime: NSNumber? {
//        return nil
//    }
//
//}

struct BaseResponse {
    let success: Bool
}

extension BaseResponse: Unmarshaling {
    init(object: MarshaledObject) throws {
        self.success = object.optionalAny(for: APIParameterName.success.rawValue) as? Bool ?? true
    }
}
