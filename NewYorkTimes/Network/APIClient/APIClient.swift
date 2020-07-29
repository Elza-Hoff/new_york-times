//
//  APIClient.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation

class APIClient {
    
    // MARK: - Constants
    
    private enum Defaults {
        static let tokenKey         = "token"
        static let sessionIdKey     = "sessionId"
        static let refreshTokenKey  = "refreshToken"
        static let expiryDate       = "expiryDate"
        static let customerInfo     = "customerInfo"
    }
    
    // MARK: - Instance
    
    static let shared = APIClient()
    
    // MARK: - Properties
    
    // MARK: - Setters
    
    var token: String? {
        set {
            guard let newValue = newValue, !newValue.isEmpty else {
                UserDefaults.standard.removeObject(forKey: Defaults.tokenKey)
                UserDefaults.standard.removeObject(forKey: Defaults.expiryDate)
                UserDefaults.standard.removeObject(forKey: Defaults.refreshTokenKey)
                return
            }
            UserDefaults.standard.set(newValue, forKey: Defaults.tokenKey)
        }
        get {
            return UserDefaults.standard.string(forKey: Defaults.tokenKey)
        }
    }
    
    var sessionId: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: Defaults.sessionIdKey)
        }
        get {
            return UserDefaults.standard.string(forKey: Defaults.sessionIdKey)
        }
    }
    
    var refreshToken: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: Defaults.refreshTokenKey)
        }
        get {
            return UserDefaults.standard.string(forKey: Defaults.refreshTokenKey)
        }
    }
    
    // MARK: - Getters
    
    var isLogged: Bool {
        return true
//        return self.token != nil && self.refreshToken != nil
    }
    
    
    // MARK: - Initialization
    
    init() { }
    
    // MARK: - Lifecycle
    
    func registerSession(handler: AuthSessionData) {
        print("[APIClient]: Register auth session with = \(handler)")
        self.token        = handler.accessToken
        self.refreshToken = handler.refreshToken
    }
    
    func unregisterSession() {
        print("[APIClient]: Auth session data has been destroyed.")
        APIClient.shared.sessionId = nil
        APIClient.shared.token = nil
    }
    
    func refreshSession() {
//        DispatchQueue.main.async {
//            NotificationCenter.default.post(name: NSNotification.Name(AppNotification.forceLoginNotification), object: nil)
//        }
    }

}
