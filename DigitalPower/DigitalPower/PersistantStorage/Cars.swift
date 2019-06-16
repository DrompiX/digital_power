//
//  Cars.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class CarStorage: Object {
    @objc dynamic var reqs_id = ""
    @objc dynamic var region = ""
    @objc dynamic var auto_number = ""
    @objc dynamic var registration = ""
    @objc dynamic var registration_full = ""
    @objc dynamic var name = ""
    
    override static func primaryKey() -> String? {
        return "reqs_id"
    }
}
