//
//  MainPresenter.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import RealmSwift

class MainPresenter: MainPresenterDelegate {
    var view: MainViewDelegate!
    
    var defaults: UserDefaults
    var authorizationManager: AuthDataManager!
    var APIClient: APIClient
    var realm: Realm
    
    var cars: Results<CarStorage>?
    var drivers: Results<DriversStorage>?
    
    init(defaults: UserDefaults, authorizationManager: AuthDataManager, APIClient: APIClient, realm: Realm) {
        self.authorizationManager = authorizationManager
        self.APIClient = APIClient
        self.defaults = defaults
        self.realm = realm
    }
    
    func onLoad() {
        view.reloadData()
    }
    
    func getNumberOfDrivers() -> Int {
        return 1
    }
    
    func getNumberOfCars() -> Int {
        if let cars = cars {
            return cars.count + 1
        } else {
            cars = realm.objects(CarStorage.self)
            return cars!.count + 1
        }
    }
    
    func onBindCarCell(cell: CarCollectionViewCell, indexPath: IndexPath) -> CarCollectionViewCell {
        if let cars = cars {
            if indexPath.row == getNumberOfCars() - 1 {
                cell.setAsPlus()
            } else {
                cell.setUpperLabel(text: cars[indexPath.row].auto_number)
                cell.setBottomLabel(text: cars[indexPath.row].region)
            }
            
        } else {
            cars = realm.objects(CarStorage.self)
            cell.setUpperLabel(text: cars![indexPath.row].name)
            cell.setBottomLabel(text: cars![indexPath.row].auto_number)
        }
        return cell
    }
    
    func onBindDriverCell(cell: DriverCollectionViewCell, indexPath: IndexPath) -> DriverCollectionViewCell {
        if indexPath.row == getNumberOfCars() - 1 {
            cell.setAsPlus()
        } else {
            cell.setUpperLabel(text: "Иванов")
            cell.setBottomLabel(text: "Пётр")
        }
        return cell
    }
    
    func getCarIDForRow(indexPath: IndexPath) -> String {
        let objects = realm.objects(CarStorage.self)
        return objects[indexPath.row].reqs_id
    }
}
