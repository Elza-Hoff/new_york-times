//
//  ObservableVMProtocol.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

protocol ObservableVMProtocol: class {
    
    func didFinishRequest()
    
    func didFailRequest(with error: Error, type: RequestType)
        
}

extension ObservableVMProtocol {
    
    func didFinishRequest() { }
    
    func didFailRequest(with error: Error, type: RequestType) { }
            
}
