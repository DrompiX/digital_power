//
//  PersistantStorageManager.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class PersistantStorageManager {
    static func saveCar(info: CarInfo, realm: Realm) {
        
        if realm.object(ofType: CarStorage.self, forPrimaryKey: info.reqs_id) == nil {
            let car = CarStorage()
            car.reqs_id = info.reqs_id
            car.auto_number = info.auto_number
            car.name = info.name
            car.registration = info.registration
            car.registration_full = info.registration_full
            car.region = info.region
            try! realm.write {
                realm.add(car)
            }
        }
    }
    
    static func saveDriver(id: String, realm: Realm) {
        let driver = DriversStorage()
        driver.reqs_id = id
        try! realm.write {
            realm.add(driver)
        }
    }
}
