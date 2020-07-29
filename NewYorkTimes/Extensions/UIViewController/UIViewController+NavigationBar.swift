//
//  UIViewController+NavigationBar.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

protocol NaviagtionBarButtonsDelegate: class {
    
    func didTouchRightButton()
    
}

extension UIViewController {
    
    //MARK: - Showing
    
    func showNavBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func hideNavBar(animated: Bool = false) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func showBackButton() {
        self.navigationItem.hidesBackButton = false
        self.navigationItem.leftBarButtonItem?.customView?.isHidden = false
    }

    func hideBackButton() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem?.customView?.isHidden = true
    }
    
    //MARK: - Title

    func add(title: String) {
        self.navigationItem.title = title
    }
    
    //MARK: - Colors
    
    func setUpBasicTintForLeftNavBarButton() {
        self.navigationItem.leftBarButtonItem?.customView?.tintColor = .white
        self.navigationItem.leftBarButtonItem?.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    func setUpTintForLeftNavBarButton(tint: UIColor) {
        self.navigationItem.leftBarButtonItem?.customView?.tintColor = tint
        self.navigationItem.leftBarButtonItem?.tintColor = tint
        self.navigationController?.navigationBar.tintColor = tint
    }
    
    func setUpNavigationBar(color: UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
    }
}

