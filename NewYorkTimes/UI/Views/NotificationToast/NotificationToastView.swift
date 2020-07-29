//
//  NotificationToastView.swift
//  Payexpert
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 PLC Group. All rights reserved.
//

import UIKit
import SwiftEntryKit
import SwiftEntryKitModality

public enum NotificationToastStyle {
    
    case error
    
    case `default`
    
    var shadowConfig: ShadowConfiguration? {
        switch self {
        default:
            return nil
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .error:
            return UIColor.red
        case .default:
            return UIColor.black.withAlphaComponent(0.8)
        }
    }
    
}

public enum NotificationToastConfig {
    
    case style(NotificationToastStyle)
    
    case custom(UIColor, ShadowConfiguration)
    
} 

class NotificationToastView: SwiftEntryKitModalityView, ModalityProtocol {
    
    // MARK: - Setters
    
    var title: String? {
        didSet {
            self.lblTitle.text = title
        }
    }
    
    var viewFont: UIFont? {
        didSet {
            self.lblTitle.font = self.viewFont
        }
    }
    
    // MARK: - Properties
    
    @IBOutlet private var view: UIView!
    
    @IBOutlet private weak var vBackground: CircleView!
    
    @IBOutlet private weak var lblTitle: UILabel!
    
    // MARK: - Initialization
    
    override func commonInit() {
        super.commonInit()
        self.fromNib()
    }
    
    // MARK: - SwiftEntryKitModalityView
    
    override func willLoadModality(attributes: inout EKAttributes) {
        attributes = EKAttributes.topToast
        attributes.windowLevel = .normal
    }
    
    // MARK: - Configure
    
    func configure(with config: NotificationToastConfig) {
        switch config {
        case let .custom(backgroundColor, shadowConfig):
            self.vBackground.backgroundColor = backgroundColor
            self.addShadow(config: shadowConfig)
            break
        case let .style(type):
            self.vBackground.backgroundColor = type.backgroundColor
            self.addShadow(config: type.shadowConfig)
            break
        }
    }

}

// MARK: - Private

extension NotificationToastView {

    private func addShadow(config: ShadowConfiguration?) {
        guard let config = config else {
            return
        }
        self.vBackground.layer.shadowOpacity   = config.opacity
        self.vBackground.layer.shadowOffset    = config.offset
        self.vBackground.layer.shadowRadius    = config.radius
        self.vBackground.layer.shadowColor     = config.color.cgColor
    }
    
}
