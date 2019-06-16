//
//  AuthorizationPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

class AuthroizationPresenter: AuthorizationPresenterDelegate {

    var view: AuthorizationViewDelegate!
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient!
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
    }
    
    func onLoad() {
        
    }
    
    func authorize() {
        APIClient.authorize() {
            error in
            return
        }
    }
}
