//
//  AppDelegateShareable.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

protocol AppDelegateShareable {
    
    static var shared: AppDelegate? { get }
    
}

//MARK: - AppDelegateShareable
extension AppDelegate: AppDelegateShareable {
    
    static var shared: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
}

