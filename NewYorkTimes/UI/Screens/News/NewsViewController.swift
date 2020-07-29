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
        return model
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        self.prepareTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showNavBar()
        self.add(title: Defaults.title)
    }
    
    private func registerCells() {
        self.tableView.register(UINib(nibName: ArticleTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }
    
}

//MARK: - StoryboardInstantiable

extension NewsViewController: StoryboardInstantiable {
    
    static var storyboardName: String {
        return Storyboard.news
    }
    
}
