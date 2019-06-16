//
//  APIClient.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class APIClient {
    let authrozationManager: AuthDataManager
    let requestManager: RequestManager
    let realm: Realm
    
    init(authorizationManager: AuthDataManager, requestManager: RequestManager, realm: Realm) {
        self.authrozationManager = authorizationManager
        self.requestManager = requestManager
        self.realm = realm
    }
    
    func authorize(completion: @escaping (_ error: String?) -> Void) {
        let rowSign = "app_id=" + Constants.appId + "&email=&password=&random=" + Constants.random + "&salt=" + Constants.salt
        let md5Data = MD5(string: rowSign)
        let sign = md5Data.map { String(format: "%02hhx", $0) }.joined()
        let url = URL(string: (Constants.baseUrl + Constants.authorization + sign))
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
        
        
        Alamofire.request(request).response { response in
            if (response.response?.statusCode == nil) {
                completion("Нет подключения к серверу")
                return
            }
            guard let responseData = response.data else {
                completion("Ответ от сервера не содержит данных")
                return
            }
            switch response.response?.statusCode {
            case 200:
                
                do {
                    let authorizationResponse = try JSONDecoder().decode(AuthorizatiomModel.self, from: responseData)
                    print(authorizationResponse)
                    self.authrozationManager.setToken(token: authorizationResponse.access_token)
                    self.authrozationManager.setUid(token: authorizationResponse.uid)
                    completion(nil)
                    return
                } catch {
                    print(error)
                }
                
            case 201:
                completion("Подпись не соответствует параметрам")
                return
            case 202:
                completion("Использован несуществующий app_id")
                return
            case 204:
                completion("Техническая ошибка, сообщить разработчику API ")
                return
            default:
                completion(nil)
                return
            }
        }
    }
    
    func addNewAuto(parameters: [String: String], completion: @escaping (_ error: String?, _ reqs_id: String?) -> Void) {
        let urlString = (Constants.baseUrl + Constants.newAutho + Constants.v2 + getURLString(parameters: parameters))
        print(urlString)
        let url = try URL.init(string: urlString)
//        print(url)
        
        guard let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        let urlEncoded1 = URL.init(string: urlEncoded)!
        
        var request = URLRequest(url: urlEncoded1)
        request.httpMethod = HTTPMethod.get.rawValue
        print(urlEncoded1)
        print(request)
        Alamofire.request(request).response { response in
            if (response.response?.statusCode == nil) {
                completion("Нет подключения к серверу", nil)
                return
            }
            guard let responseData = response.data else {
                completion("Ответ от сервера не содержит данных", nil)
                return
            }
            switch response.response?.statusCode {
            case 200:
                do {
                    let authorizationResponse = try JSONDecoder().decode(UnitResponse.self, from: responseData) 
                    completion(nil, authorizationResponse.reqs_id)
                    return
                } catch {
                    print(error)
                }
                
            case 201:
                completion("Подпись не соответствует параметрам", nil)
                return
            case 202:
                completion("Использован несуществующий app_id", nil)
                return
            case 204:
                completion("Техническая ошибка, сообщить разработчику API ", nil)
                return
            case 302:
                completion("Техническая ошибка, невозможно создать экземпляр реквизитов, сообщить разработчику API", nil)
                return
            default:
                completion(nil, nil)
                return
            }
        }
    }
    
    func addNewDriver(parameters: [String: String], completion: @escaping (_ error: String?) -> Void) {
        let url = URL(string: (Constants.baseUrl + Constants.newDriver + Constants.v2 + getURLString(parameters: parameters)))
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
        Alamofire.request(request).response { response in
            if (response.response?.statusCode == nil) {
                completion("Нет подключения к серверу")
                return
            }
            guard let responseData = response.data else {
                completion("Ответ от сервера не содержит данных")
                return
            }
            switch response.response?.statusCode {
            case 200:
                guard let authorizationResponse = try? JSONDecoder().decode(UnitResponse.self, from: responseData) else {
                    completion("Ошибка парсинга JSON")
                    return
                }
                completion(nil)
                return
            case 201:
                completion("Подпись не соответствует параметрам")
                return
            case 202:
                completion("Использован несуществующий app_id")
                return
            case 204:
                completion("Техническая ошибка, сообщить разработчику API ")
                return
            case 302:
                completion("Техническая ошибка, невозможно создать экземпляр реквизитов, сообщить разработчику API")
                return
            default:
                completion(nil)
                return
            }
        }
    }
    
    func getURLString(parameters: [String : String]) -> String {
        var result = ""
        for parameter in parameters {
            if parameter.value != "" {
                result += "&"
                result += parameter.key + "="
                result += parameter.value
            }
        }
        let token = authrozationManager.getToken()!
        result += "&access_token=" + token
        return result
    }
    
    func loadAutoInfo(id: String, completion: @escaping (_ error: String?) -> Void) {
        let token = authrozationManager.getToken() ?? ""
        let parameters = ["access_token" : token, "reqs_id" : id]
        let url = URL(string: (Constants.baseUrl + Constants.autoInfo + Constants.v2 + getURLString(parameters: parameters)))
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethod.get.rawValue
        Alamofire.request(request).response { response in
            if (response.response?.statusCode == nil) {
                completion("Нет подключения к серверу")
                return
            }
            guard let responseData = response.data else {
                completion("Ответ от сервера не содержит данных")
                return
            }
            switch response.response?.statusCode {
            case 200:
                guard let response = try? JSONDecoder().decode(CarInfo.self, from: responseData) else {
                    completion("Ошибка парсинга JSON")
                    return
                }
                PersistantStorageManager.saveCar(info: response, realm: self.realm)
                completion(nil)
                return
            case 201:
                completion("Подпись не соответствует параметрам")
                return
            case 202:
                completion("Использован несуществующий app_id")
                return
            case 204:
                completion("Техническая ошибка, сообщить разработчику API ")
                return
            case 302:
                completion("Техническая ошибка, невозможно создать экземпляр реквизитов, сообщить разработчику API")
                return
            default:
                completion(nil)
                return
            }
        }
    }
    
    func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    func loadFines(id: String, completion: @escaping (_ fines: [Fine]?, _ error: String?) -> Void) {
        let parameters = ["reqs_id" : id]
        let urlString = (Constants.baseUrl + Constants.fines + Constants.v2 + getURLString(parameters: parameters))
        print(urlString)
        guard let urlEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        let urlEncoded1 = URL.init(string: urlEncoded)!
        
        var request = URLRequest(url: urlEncoded1)
        request.httpMethod = HTTPMethod.get.rawValue
        print(urlEncoded1)
        print(request)
        Alamofire.request(request).response { response in
            if (response.response?.statusCode == nil) {
                completion(nil, "Нет подключения к серверу")
                return
            }
            guard let responseData = response.data else {
                completion(nil, "Ответ от сервера не содержит данных")
                return
            }
            switch response.response?.statusCode {
            case 200:
                do {
                    let result = try JSONDecoder().decode(Fines.self, from: responseData)
                    completion(result.fines, nil)
                    return
                } catch {
                    print(error)
                }
                
            case 201:
                completion(nil, "Подпись не соответствует параметрам")
                return
            case 202:
                completion(nil, "Использован несуществующий app_id")
                return
            case 204:
                completion(nil, "Техническая ошибка, сообщить разработчику API ")
                return
            case 302:
                completion(nil, "Техническая ошибка, невозможно создать экземпляр реквизитов, сообщить разработчику API")
                return
            default:
                completion(nil, nil)
                return
            }
        }
    }
}
