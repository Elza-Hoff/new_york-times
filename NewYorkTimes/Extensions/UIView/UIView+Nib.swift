//
//  UIView+Nib.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/22/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit
import QuickLayout

extension UIView {
    
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(type(of: self).className, owner: self, options: nil)?.first as? T else {
            return nil
        }
        addSubview(contentView)
        contentView.fillSuperview()
        return contentView
    }

}
