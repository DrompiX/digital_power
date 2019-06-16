
//
//  AuthorizationContracr.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol AuthorizationViewDelegate {
    var presenter: AuthorizationPresenterDelegate! { get set }
}

protocol AuthorizationPresenterDelegate {
    var view: AuthorizationViewDelegate! { get set }
    func onLoad()
    func authorize()
}
