//
//  TokenManager.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//
import Foundation
import Alamofire

class AuthDataManager {
    private let defaults: UserDefaults
    private let tokenKey = "token"
    private let uidKey = "uidToken"
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    func setToken(token: String) {
        defaults.set(token, forKey: tokenKey)
    }
    
    func needToken() -> Bool {
        return defaults.string(forKey: tokenKey) == ""
    }
    
    func getToken() -> String? {
        return defaults.string(forKey: tokenKey)
    }
    
    func removeToken() {
        defaults.set("", forKey: tokenKey)
    }
    
    func setUid(token: String) {
        defaults.set(token, forKey: uidKey)
    }
    
    func getUid() -> String? {
        return defaults.string(forKey: uidKey)
    }
    
    func removeUid() {
        defaults.set("", forKey: uidKey)
    }
}
