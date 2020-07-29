//
//  StoryboardInstantiable.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable: class {
    
    static var storyboardName: String { get }
    
}

extension StoryboardInstantiable where Self: UIViewController {
    
    static func storyboardInstance() -> Self? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as? Self
    }
    
}

