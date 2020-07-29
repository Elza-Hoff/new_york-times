//
//  ArticleNetworkHandlerComponent.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

import UIKit

class ArticleNetworkHandlerComponent: BaseNetworkHandler {
    
    func getArtArticles(completion: @escaping([ShortArticleData]) -> Void) {
        let request = APIClient.shared.getArtArticles { [weak self] (response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    self?.delegate?.state = .failure(APIErrorValidator(error), .arts)
                    return
                }
                guard let result = response?.result else {
                    self?.delegate?.state = .failure(.objectNotFound(errorDescription: nil), .arts)
                    return
                }
                completion(result)
                self?.finishRequest(type: .arts)
            }
        }
        startRequest(with: request, type: .arts)
    }
    
}
