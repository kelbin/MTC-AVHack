//
//  SessionStorage.swift
//  MTC-AVHack
//
//  Created by Максим Савченко on 09/05/2020.
//  Copyright © 2020 Максим Савченко. All rights reserved.
//

import Foundation

enum Consts {
    static let authHeaderToken = "Authorization"
}

final class SessionStorage {
    
    static let shared = SessionStorage()
    
    private let authTokenKey = "auth_token"
    private let userDefaults = UserDefaults.standard
    
    
    private init() {}
    
    // Authorization token
    
    var pincode: String {
        return "1111"
    }
    
    var token: String? {
        
        get {
            return userDefaults.string(forKey: authTokenKey)
        }
        
        set {
            
            if let newDid = newValue {
                userDefaults.setValue(newDid, forKey: authTokenKey)
            } else {
                userDefaults.removeObject(forKey: authTokenKey)
            }
            
            userDefaults.synchronize()
        }
        
    }
    
    fileprivate var currentSession: URLSession?
    
    var urlSession: URLSession {
        
        guard currentSession != nil else {
            let config = URLSessionConfiguration.default
            config.urlCache = URLCache.shared
            var dict = [String: String]()
            if let authToken = token {
                dict[Consts.authHeaderToken] = authToken
            }
            config.httpAdditionalHeaders = dict
            currentSession = URLSession(configuration: config)
            return currentSession!
        }
        
        return currentSession!
    }
    
    var customizeReqClosure: ((URLRequest) -> URLRequest) {
        return { request in
            
            var req = request
            
            if let token = SessionStorage.shared.token {
                req.addValue("Bearer \(token)", forHTTPHeaderField: Consts.authHeaderToken)
            }
            
            return req
        }
        
    }
    
    func resetSession() {
        currentSession = nil
    }
    
    func resetAllSession() {
        token = nil
        resetSession()
    }
}
