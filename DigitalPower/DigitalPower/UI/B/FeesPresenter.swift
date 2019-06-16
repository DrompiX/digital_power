//
//  FeesPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class BPresenter: BPresenterDelegate {
    var view: BViewDelegate!
    var realm: Realm
    
    let APIClient: APIClient!
    
    init(APIClient: APIClient, realm: Realm) {
        self.APIClient = APIClient
        self.realm = realm
    }
    
    
    func getNumberOfItems() -> Int {
        return realm.objects(CarStorage.self).count
    }
    
    func onBindFeeCell(cell: FeeCell, indexPath: IndexPath) -> FeeCell {
        let objects = realm.objects(CarStorage.self)
        cell.setTitleLabel(text: objects[indexPath.row].name)
        cell.setInfoLabel(text: objects[indexPath.row].auto_number)
        return cell
    }
    
    func getCarIDForRow(indexPath: IndexPath) -> String {
        let objects = realm.objects(CarStorage.self)
        return objects[indexPath.row].reqs_id
    }
}
