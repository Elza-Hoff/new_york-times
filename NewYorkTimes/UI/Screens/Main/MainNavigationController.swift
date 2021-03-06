//
//  MainNavigationController.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

class MainNavigationController: BaseNavigationController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavBar()
        self.showBackButton()
    }
    
}

// MARK: - StoryboardInstantiable

extension MainNavigationController: StoryboardInstantiable {
    
    static var storyboardName: String {
        return Storyboard.main
    }
    
}
