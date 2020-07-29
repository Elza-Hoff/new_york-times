//
//  NSObject+ClassName.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/22/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
}

