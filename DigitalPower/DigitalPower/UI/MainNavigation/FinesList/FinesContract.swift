//
//  FinesContracr.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol FinesListViewDelegate {
    var presenter: FinesListPresenterDelegate! { get set }
}

protocol FinesListPresenterDelegate {
    var view: FinesListViewDelegate! { get set }
}
