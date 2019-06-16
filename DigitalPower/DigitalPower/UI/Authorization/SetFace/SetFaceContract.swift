//
//  SetFaceContracr.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol SetFaceViewDelegate {
    var presenter: SetFacePresenterDelegate! { get set }
}

protocol SetFacePresenterDelegate {
    var view: SetFaceViewDelegate! { get set }
    func onLoad()
}
