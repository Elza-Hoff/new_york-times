//
//  ShortArticleData.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation
import Marshal

struct ShortArticleData {
    
    let title: String
    let abstract: String
    
}

// MARK: - Unmarshaling

extension ShortArticleData: Unmarshaling {
    
    init(object: MarshaledObject) throws {
        title = try object.any(for: APIParameterName.title.rawValue) as? String ?? "Undefined"
        abstract = try object.any(for: APIParameterName.abstract.rawValue) as? String ?? "Undefined"
    }
    
}
