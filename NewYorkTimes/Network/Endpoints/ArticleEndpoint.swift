//
//  ArticleEndpoint.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

class ArtArticleEndpoint: BaseEndpoint, APIEndpoint {
    
    typealias ResponseType = ArticleResponse
    
    var path: String {
        return APIPath.arts
    }
    
    override var method: HTTPMethod {
        return .get
    }
    
}

struct ArticleResponse: Unmarshaling {
    
    var result = [ShortArticleData]()
    
    init(object: MarshaledObject) throws {
        if let items = object.optionalAny(for: APIParameterName.results.rawValue) as? [MarshaledObject] {
            for item in items {
                result.append(try ShortArticleData(object: item))
            }
        }
    }
    
}
