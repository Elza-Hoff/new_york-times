//
//  ArticleObservableVM.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ArticleObservableVM: NetworkStateProtocol, ArticlesUsecase {
    
    // MARK: - Instance
    
    static let shared = ArticleObservableVM()
    
    //MARK: - Properties
    
    private var articles: BehaviorRelay<[ShortArticleData]> = BehaviorRelay(value: [])
    
    weak var delegate: ObservableVMProtocol?
    
    // MARK: - ArticlesUsecase
    
    lazy var articlesNetworkComponent: ArticleNetworkHandlerComponent = {
        let component = ArticleNetworkHandlerComponent()
        component.delegate = self
        return component
    }()
    
    // MARK: - NetworkStateProtocol
    
    var state: State = .none {
        willSet {
            update(newState: newValue)
        }
    }
    
    func update(newState: State) {
        switch (state, newState) {
        case ( _, .loading):
            break
        case (_, .success):
            break
        case (_, .finish(_)):
            self.delegate?.didFinishRequest()
            break
        case (_, .failure(let error, let request)):
            self.delegate?.didFailRequest(with: error, type: request)
            print("Some error occured: \(error)")
            break
        default:
            break
        }
    }
    
    // MARK: - Initialization
    
    init() { }
    
    // MARK: - Public
    
    public func fetchArticles() {
        self.getArtArticles { (articles) in
            self.articles.accept(articles)
        }
    }
    
    public func getArticles() -> BehaviorRelay<[ShortArticleData]> {
        return self.articles
    }
    
}
