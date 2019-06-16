//
//  StartNavigationContract.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol StartNavigationViewDelegate {
    var presenter: StartNavigationPresenterDelegate! { get set }
    func openAuthorizationSceen()
    func openOnBoarding()
}

protocol StartNavigationPresenterDelegate {
    var view: StartNavigationViewDelegate! { get set }
    func onLoad()
}
