//
//  ArticlesUsecase.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

// MARK: - Declaration

protocol ArticlesUsecase {
    
    var articlesNetworkComponent: ArticleNetworkHandlerComponent { get }
    
    func getArtArticles(completion: @escaping([ShortArticleData]) -> Void)
    
}

// MARK: - Implementation

extension ArticlesUsecase {
    
    func getArtArticles(completion: @escaping([ShortArticleData]) -> Void) {
        articlesNetworkComponent.getArtArticles(completion: completion)
    }
    
}
