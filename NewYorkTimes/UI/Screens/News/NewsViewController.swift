//
//  NewsViewController.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    
    //MARK: - Defaults
    
    private enum Defaults {
        static let title = "News"
    }
    
    //MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: NewsViewModel = {
        let model = NewsViewModel()
        model.observableDelegate = self
        return model
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.prepareTableView()
        self.showHUD(type: .loading)
        self.viewModel.fetchArticles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavBar()
        self.hideBackButton()
        self.add(title: Defaults.title)
    }
    
    private func registerCells() {
        self.tableView.register(UINib(nibName: ArticleTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }
    
    //MARK: - Handlers
    
    @IBAction func didTouchRefreshButton(_ sender: Any) {
        self.showHUD(type: .loading)
        self.viewModel.fetchArticles()
    }
    
}

//MARK: - StoryboardInstantiable

extension NewsViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        return Storyboard.news
    }
    
}
