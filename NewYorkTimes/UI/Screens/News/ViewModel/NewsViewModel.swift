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
            
    private var articles: BehaviorRelay<[Article]> = BehaviorRelay(value: [])
    
    //MARK: - Initialization
    
    
    //MARK: - Lifecycle
    
    func getArticles() -> BehaviorRelay<[Article]> {
        return self.articles
    }
    
    func prepareBinders() {
    }
}
