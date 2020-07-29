//
//  BaseViewController.swift
//  MakeAStep
//
//  Created by Yelyzaveta Kartseva on 3/18/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    
    //MARK: - Defaults
    
    enum Controller {
        case news
        case savedNews
        
        var rawValue: UIViewController {
            switch self {
            case .news: return UIViewController()
            case .savedNews: return UIViewController()
            }
        }
        
    }
    
    //MARK: - Properties
    
    let disposeBag = DisposeBag()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func load(controller: Controller) {
        if self.navigationController?.topViewController?.className == controller.rawValue.className {
            dismiss(animated: true, completion: nil)
            return
        }
        self.navigationController?.pushViewController(controller.rawValue, animated: true)
    }
}

//MARK: - Notifications
extension BaseViewController {
    
//    func showToast(message: String, style: NotificationToastStyle = .default) {
//        let notification = NotificationToastView()
//        notification.title = message
//        notification.configure(with: NotificationToastConfig.style(style))
//        notification.show()
//    }
//
//    func showInDevelopmnetToast() {
//        let notification = NotificationToastView()
//        notification.title = "In development"
//        notification.configure(with: NotificationToastConfig.style(.default))
//        notification.show()
//    }
}

//MARK: - UIStatusBarStyle
extension BaseViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
}

//MARK: - UINavigationControllerDelegate
extension BaseViewController: UINavigationControllerDelegate {
    
}
