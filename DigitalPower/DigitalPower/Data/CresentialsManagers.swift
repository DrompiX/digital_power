//
//  CresentialsManagers.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

//class CredentialsManager {
//    let pinCodeKeychainAlias = "password"
//    let loginKeychainAlias = "login"
//    
//    func saveLoginAndPassword(login: String, password: String) throws {
//        
//        let pinCodeItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
//                                               account: pinCodeKeychainAlias,
//                                               accessGroup: KeychainConfiguration.accessGroup)
//        try pinCodeItem.savePassword(password)
//        let loginItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
//                                             account: loginKeychainAlias,
//                                             accessGroup: KeychainConfiguration.accessGroup)
//        // Save the password for the new item.
//        try loginItem.savePassword(login)
//    }
//    
//    func getLoginAndPassword() throws -> (login: String, password: String) {
//        let pinCodeItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
//                                               account: pinCodeKeychainAlias,
//                                               accessGroup: KeychainConfiguration.accessGroup)
//        let password = try pinCodeItem.readPassword()
//        
//        let loginItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
//                                             account: loginKeychainAlias,
//                                             accessGroup: KeychainConfiguration.accessGroup)
//        // Save the password for the new item.
//        let login = try loginItem.readPassword()
//        return (login, password)
//    }
//}
