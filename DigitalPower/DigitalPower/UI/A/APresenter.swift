//
//  APresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

class APresenter: APresenterDelegate {
    var view: AViewDelegate!
    
    let APIClient: APIClient!
    
    init(APIClient: APIClient) {
        self.APIClient = APIClient
    }
    
    func setCar(parameters: [String : String]) {
        APIClient.addNewAuto(parameters: parameters) {
            error, reqsId in
            if let reqsId = reqsId {
                self.APIClient.loadAutoInfo(id: reqsId) {
                    error in
                }
            }
        }
    }
    
    func setDriver(parameters: [String : String]) {
        APIClient.addNewDriver(parameters: parameters) {
            error in
        }
    }
}
