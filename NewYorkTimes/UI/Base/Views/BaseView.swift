//
//  BaseView.swift
//  Payexpert
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 PLC Group. All rights reserved.
//

import UIKit

class BaseView: UIView, CommonInitable {

    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() { }

}
