//
//  Drivers.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class DriversStorage: Object {
    @objc dynamic var reqs_id = ""
    
    override static func primaryKey() -> String? {
        return "reqs_id"
    }
}
