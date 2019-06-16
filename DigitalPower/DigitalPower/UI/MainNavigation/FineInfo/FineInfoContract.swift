//
//  FineInfoContract.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol FineInfoViewDelegate {
    var presenter: FineInfoPresenterDelegate! { get set }
    func reloadData()
    func loadData(fine: Fine)
}

protocol FineInfoPresenterDelegate {
    var view: FineInfoViewDelegate! { get set }
    func onLoad()
    func setFine(fine: Fine?)
    func getId() -> String
}
