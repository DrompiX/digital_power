//
//  MainContracr.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

protocol MainViewDelegate {
    var presenter: MainPresenterDelegate! { get set }
    func reloadData() 
}

protocol MainPresenterDelegate {
    var view: MainViewDelegate! { get set }
    func onLoad()
    func getNumberOfDrivers() -> Int 
    func getNumberOfCars() -> Int
    func onBindCarCell(cell: CarCollectionViewCell, indexPath: IndexPath) -> CarCollectionViewCell
    func onBindDriverCell(cell: DriverCollectionViewCell, indexPath: IndexPath) -> DriverCollectionViewCell
}
