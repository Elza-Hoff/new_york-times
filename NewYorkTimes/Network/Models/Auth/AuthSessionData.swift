//
//  AuthSessionData.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Marshal

struct AuthSessionData {
    let refreshToken: String
    let accessToken: String
}

// MARK: - Unmarshaling
extension AuthSessionData: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        refreshToken    = try object.any(for: APIParameterName.refreshToken.rawValue) as! String
        accessToken     = try object.any(for: APIParameterName.accessToken.rawValue) as! String
    }
    
}
