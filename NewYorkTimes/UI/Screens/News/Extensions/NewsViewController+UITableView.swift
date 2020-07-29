//
//  NewsViewController+UITableView.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension NewsViewController {
    
    func prepareTableView() {
        self.prepareTableViewDelegate()
        self.prepareTableViewDataBinding()
    }
    
    private func prepareTableViewDelegate() {
        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
    
    private func prepareTableViewDataBinding() {
        self.viewModel.getArticles().bind(to: self.tableView.rx.items(cellIdentifier: ArticleTableViewCell.identifier,
                 cellType: ArticleTableViewCell.self)) {
                  row, article, cell in
                    cell.configureCellWith(title: article.title, description: article.abstract, icon: nil)
        }
        .disposed(by: self.disposeBag)
    }
    
}

//MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.width * TableViewSizes.aspectRatioArticleCell
    }
    
}

extension NewsViewController {
    
    fileprivate enum TableViewSizes {
        static let aspectRatioArticleCell: CGFloat = 0.9
    }
    
}
