//
//  FinesListPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class FinesListPresenter: FinesListPresenterDelegate {
    var view: FinesListViewDelegate!
    
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient
    var id: String?
    var fines: [Fine]?
    var realm: Realm
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient, realm: Realm) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
        self.realm = realm
    }
    
    func setId(id: String) {
        self.id = id
    }
    
    func onLoad() {view.showAlert(text: "Загрузка списка. Пожалуйста, подождите")
        print(UserDefaults.standard.bool(forKey: authorizationManager.getToken()! + id!))
        if !UserDefaults.standard.bool(forKey: authorizationManager.getToken()! + id!) {
            if let car = PersistantStorageManager.getCarForID(id: id!, realm: realm) {
                let parameters = ["region" : car.region, "auto_number": car.auto_number, "registration_full" : car.registration_full]
                APIClient.addNewAuto(parameters: parameters) {
                    error, reqsId in
                    self.APIClient.loadAutoInfo(id: self.id!) {
                        error in
                        if let id = self.id {
                            self.APIClient.loadFines(id: id) {
                                fines, error in
                                self.view.hideAlert {
                                    UserDefaults.standard.set(true, forKey: self.authorizationManager.getToken()! + id)
                                    UserDefaults.standard.synchronize()
                                    self.fines = fines
                                    self.view.reloadTableView()
                                }
                            }
                        }
                    }
                }
            }
        } else {
            self.APIClient.loadFines(id: id!) {
                fines, error in
                self.view.hideAlert {
                    self.fines = fines
                    self.view.reloadTableView()
                }
            }
        }
    }
    
    func onBindFeeCell(cell: FineTableViewCell, indexPath: IndexPath) -> FineTableViewCell {
        if let fines = fines {
            if indexPath.row < fines.count {
                cell.setTitleLabel(titleText: fines[indexPath.row].title)
                cell.setDescription(text: fines[indexPath.row].sumd)
                cell.setDate(text: fines[indexPath.row].date)
                cell.setStatus(text: fines[indexPath.row].status)
            }
        }
        return cell
    }
    
    func getNumberOfFines() -> Int {
        if let fines = fines {
            return fines.count
        }
        return 0
    }
    
    func getFineForIndexPath(indexPath: IndexPath) -> Fine? {
        if let fines = fines {
            return fines[indexPath.row]
        }
        return nil
    }
}
