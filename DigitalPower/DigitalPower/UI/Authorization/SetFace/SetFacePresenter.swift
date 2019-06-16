//
//  SetFacePresente.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation


class SetFacePresenter: SetFacePresenterDelegate {
    func onLoad() {
        
    }
    
    var view: SetFaceViewDelegate!
    
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient
    var fine: Fine?
    
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
    }
}
