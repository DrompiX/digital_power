//
//  FeesContract.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol BViewDelegate {
    var presenter: BPresenterDelegate! { get set }
}

protocol BPresenterDelegate {
    var view: BViewDelegate! { get set }
    func getNumberOfItems() -> Int
    func onBindFeeCell(cell: FeeCell, indexPath: IndexPath) -> FeeCell
    func getCarIDForRow(indexPath: IndexPath) -> String
}
