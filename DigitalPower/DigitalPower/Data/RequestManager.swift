//
//  RequestManager.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager {
    
    func authorize(authorizationManager: AuthDataManager,
                   completion: @escaping (_ error: String?) -> Void) {
        
        let url = URL(string: (Constants.baseUrl + Constants.authorization))
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
                guard let authorizationResponse = try? JSONDecoder().decode(AuthorizatiomModel.self, from: responseData) else {
                    completion("Ошибка парсинга JSON")
                    return
                }
                print(authorizationResponse)
                authorizationManager.setToken(token: authorizationResponse.access_token)
                authorizationManager.setUid(token: authorizationResponse.uid)
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
            default:
                completion(nil)
                return
            }
        }
    }
}
