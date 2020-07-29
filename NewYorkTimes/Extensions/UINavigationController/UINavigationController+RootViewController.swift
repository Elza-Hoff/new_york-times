//
//  UINavigationController+RootViewController.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

extension UINavigationController {

    var rootViewController: UIViewController? {
        return viewControllers.first
    }
    
}

