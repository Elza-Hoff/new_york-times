//
//  CircleView.swift
//  Payexpert
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 PLC Group. All rights reserved.
//

import UIKit

class CircleView: BaseView {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height * 0.5
    }
    
}
