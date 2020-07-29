//
//  SplashViewController+Scene.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit

extension SplashViewController: SceneProtocol {
    
    // MARK: - SceneProtocol
    
    typealias Scene = SplashScene

    // MARK: - Constants
    
    internal enum SplashScene: SceneConfigurable {
        
        case main
        case signIn
        
        var config: SceneConfig? {
            switch self {
            case .signIn:
                print("Sign In screen is in development")
                return SceneConfig(controller: UIViewController(),
                                   initialType: .swap,
                                   isAnimated: false)
            case .main:
                return SceneConfig(controller: NewsViewController.storyboardInstance()!,
                                   initialType: .swap,
                                   isAnimated: false)
            }
        }

    }

}
