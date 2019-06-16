//
//  ResponseStructures.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

struct AuthorizatiomModel: Codable {
    var uid: String
    var access_token: String
    
    private enum CodingKeys: String, CodingKey {
        case uid
        case access_token
    }
}


struct UnitResponse: Codable {
    var reqs_id: String
    
    private enum CodingKeys: String, CodingKey {
        case reqs_id
    }
}

struct Titles: Codable {
    var text: String
    var style: String
    
    private enum CodingKeys: String, CodingKey {
        case text
        case style
    }
}

struct Fines: Codable {
    var fines: [Fine]
    
    private enum CodingKeys: String, CodingKey {
        case fines
    }
}

struct Fine: Codable {
    var fine_id: String
    var title: [Titles]
    var date: String
    var sumd: String
    var status: String
    var protocolInfo: String
    var reqs_id: String
    var expiry_date: String
    
    var location: String?
    var location_coordinates: String?
    var location_map_link: String?
    var location_zoom: String?
    var discount_sum: String?
    var discount_date: String?
    var violation_date: String?
    var photos: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case fine_id
        case title
        case date
        case sumd
        case status
        case protocolInfo = "protocol"
        case reqs_id
        case expiry_date
        case location
        case location_coordinates
        case location_map_link
        case location_zoom
        case discount_sum
        case discount_date
        case violation_date
        case photos
        
    }
}

struct CarInfo: Codable {
    var reqs_id: String
    var region: String
    var auto_number: String
    var registration: String
    var registration_full: String
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case reqs_id
        case region
        case auto_number
        case registration
        case registration_full
        case name
    }
}
