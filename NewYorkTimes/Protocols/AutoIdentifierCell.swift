//
//  AutoIdentifierCell.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit
import MapKit

protocol AutoIndentifierCell: class {
    static var identifier: String { get }
    
    static var nibName: String { get }
}

extension AutoIndentifierCell where Self: UITableViewCell {
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension AutoIndentifierCell where Self: UICollectionViewCell {
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension AutoIndentifierCell where Self: MKAnnotationView {
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}

extension AutoIndentifierCell where Self: UITableViewHeaderFooterView {
    static var identifier: String {
        return self.nibName
    }
    
    static var nibName: String {
        return String(describing: self)
    }
}
