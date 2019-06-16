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
    func reloadTableView()
    func showAlert(text: String) 
    func hideAlert(completion: @escaping () -> Void)
}

protocol FinesListPresenterDelegate {
    var view: FinesListViewDelegate! { get set }
    func onLoad()
    func onBindFeeCell(cell: FineTableViewCell, indexPath: IndexPath) -> FineTableViewCell
    func getNumberOfFines() -> Int
    func setId(id: String)
    func getFineForIndexPath(indexPath: IndexPath) -> Fine? 
}
