//
//  APIClient+Articles.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire
import Marshal

extension APIClient {
    
    func getArtArticles(completion: @escaping (ArticleResponse?, Error?) -> Void) -> DataRequest {
        let endpoint = ArtArticleEndpoint(attributes: nil)
        return manager.requestJSON(baseURL, endpoint: endpoint, completion: completion)
    }
    
}
