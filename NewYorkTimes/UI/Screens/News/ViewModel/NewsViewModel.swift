//
//  NewsViewModel.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class NewsViewModel: NSObject {
    
    //MARK: - Properties
                
    //MARK: - Initialization
    
    //MARK: - Lifecycle
    
    weak var observableDelegate: ObservableVMProtocol? {
        didSet {
            ArticleObservableVM.shared.delegate = observableDelegate
        }
    }
    
    func getArticles() -> BehaviorRelay<[ShortArticleData]> {
        return ArticleObservableVM.shared.getArticles()
    }
    
    func fetchArticles() {
        ArticleObservableVM.shared.fetchArticles()
    }
    
}
