//
//  NewsViewController+ObservableVMProtocol.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

extension NewsViewController: ObservableVMProtocol {
    
    func didFinishRequest() {
        self.hideHUD()
    }
        
    func didFailRequest(with error: Error, type: RequestType) {
        self.hideHUD()
        self.showToast(message: error.localizedDescription)
    }
}
