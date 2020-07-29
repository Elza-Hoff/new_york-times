//
//  RechabilityManager.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Alamofire

protocol RechabilityState {
    var connectionRestore: (() -> Void)? { get set }
    var connectionLost: (() -> Void)? { get set }
    func isConnected() -> Bool
}

class RechabilityManager: RechabilityState {
    var connectionRestore: (() -> Void)?
    var connectionLost: (() -> Void)?
    
    private var rechabilityManager = Alamofire.NetworkReachabilityManager(host: APIConstants.reachabilityManagerHost)
    
    init() {
        rechabilityManager?.listener = { [weak self] (status) in
            switch status {
                
            case .notReachable, .unknown:
                self?.connectionLost?()
            case .reachable(.ethernetOrWiFi), .reachable(.wwan):
                self?.connectionRestore?()
            }
        }
        rechabilityManager?.startListening()
    }
    
    deinit {
        rechabilityManager?.stopListening()
    }
    
    // MARK: - RechabilityState
    
    func isConnected() -> Bool {
        return rechabilityManager?.isReachable ?? false
    }
}
