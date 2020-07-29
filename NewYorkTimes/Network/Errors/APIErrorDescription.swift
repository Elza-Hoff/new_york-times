//
//  APIErrorDescription.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Marshal

struct APIErrorDescription {
    
    let code: String?
    let text: String
    
}

//MARK: - Unmarshaling
extension APIErrorDescription: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        code = object.optionalAny(for: APIParameterName.code.rawValue) as? String
        text = try object.any(for: APIParameterName.message.rawValue) as! String
    }
    
}
