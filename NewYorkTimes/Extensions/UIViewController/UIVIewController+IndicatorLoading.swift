//
//  UIVIewController+IndicatorLoading.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 6/20/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit
import KRProgressHUD

extension UIViewController {
    
    enum HudTypes {
        case loading
        
        var description: String {
            switch self {
            case .loading: return HudDescriptions.loading
            }
        }
    }
    
    enum HudDescriptions {
        static let loading = "Loading..."
    }
    
    func showHUD(type: HudTypes) {
        KRProgressHUD.show(withMessage: type.description) {
            print("showHUD")
        }
    }
    
    func showHUD() {
        print("showHUD")
        KRProgressHUD.show()
    }
    
    func hideHUD() {
        print("hideHUD")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
           KRProgressHUD.dismiss()
        }
    }
    
}
