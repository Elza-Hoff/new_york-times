//
//  UINavigationController+NavigationBarStyle.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    //MARK: - Constants
    
    enum NavigationBarStyle {
        case white
        case lightGray
    }
    
    func applyBackgroundNavigation(with style: NavigationBarStyle) {
        switch style {
        case .lightGray:
            self.navigationBar.barTintColor = .lightGray
            break
        case .white:
            self.navigationBar.barTintColor = .white
            break
        }
    }
    
}

