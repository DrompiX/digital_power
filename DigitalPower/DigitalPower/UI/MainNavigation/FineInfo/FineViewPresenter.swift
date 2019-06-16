//
//  FineViewPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class FineInfoPresenter: FineInfoPresenterDelegate {
    var view: FineInfoViewDelegate!
    
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient
    var realm: Realm
    var fine: Fine?
    
    var cars: Results<CarStorage>?
    var drivers: Results<DriversStorage>?
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient, realm: Realm) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
        self.realm = realm
    }
    
    func setFine(fine: Fine?) {
        self.fine = fine
    }
    
    func onLoad() {
        if let fine = fine {
            view.loadData(fine: fine)
        }
    }
    
    func getId() -> String {
        return fine!.reqs_id
    }
}
