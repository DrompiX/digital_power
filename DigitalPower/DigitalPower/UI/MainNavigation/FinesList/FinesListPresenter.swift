//
//  FinesListPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

class FinesListPresenter: FinesListPresenterDelegate {
    var view: FinesListViewDelegate!
    
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient!
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
    }
}
