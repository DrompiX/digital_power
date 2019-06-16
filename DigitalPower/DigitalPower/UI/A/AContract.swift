//
//  AContract.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol AViewDelegate {
    var presenter: APresenterDelegate! { get set }
    func presentList()
}

protocol APresenterDelegate {
    var view: AViewDelegate! { get set }
    func setCar(parameters: [String : String])
    func setDriver(parameters: [String : String])
    
}
