//
//  UIView+Curve.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/22/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

extension UIView {
  
    func cutViewOntTopWith(desiredCurve: CGFloat, view width: CGFloat) {
        let path = UIBezierPath(rect: bounds)
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: 0), controlPoint: CGPoint(x: self.frame.width / 2 , y: desiredCurve))
        let mask = CAShapeLayer()
        mask.fillRule = .evenOdd
        mask.path = path.cgPath
        layer.mask = mask
    }
}
