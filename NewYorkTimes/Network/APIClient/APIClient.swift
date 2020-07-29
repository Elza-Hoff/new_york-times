//
//  APIClient.swift
//  NewYorkTimes
//
//  Created by Yelyzaveta Kartseva on 7/29/20.
//  Copyright © 2020 Yelyzaveta Kartseva. All rights reserved.
//

import Foundation
import Alamofire
import Marshal

class APIClient {
    
    // MARK: - Constants
    
    private enum Defaults {
        static let tokenKey         = "token"
        static let sessionIdKey     = "sessionId"
        static let refreshTokenKey  = "refreshToken"
        static let expiryDate       = "expiryDate"
        static let apiKey           = "juafAy6StLxVWZhlNVDGEGSACP3wkGHq"
    }
    
    // MARK: - Instance
    
    static let shared = APIClient()
    
    // MARK: - Properties
    
    let baseURL: URL = URL(string: APIConstants.apiURL)!
    
    lazy var manager: SessionManager = {
        let manager: SessionManager = Alamofire.SessionManager(
            configuration: sessionConfiguration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        manager.adapter = APIClientAdapter()
        return manager
    }()
    
    // MARK: - Setters
    
    var apiKey = "juafAy6StLxVWZhlNVDGEGSACP3wkGHq"
    
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
    }
    
    // MARK: - Initialization
    
    init() { }
    
}
