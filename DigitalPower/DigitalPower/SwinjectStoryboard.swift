//
//  SwinjectStoryboard.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//
import Foundation
import Swinject
import SwinjectStoryboard
import RealmSwift

extension SwinjectStoryboard {
    @objc class func setup() {
        defaultContainer.register(UserDefaults.self) {
            _ in UserDefaults.standard
        }
        defaultContainer.register(AuthDataManager.self) {
            _ in AuthDataManager(defaults: defaultContainer.resolve(UserDefaults.self)!)
        }
        defaultContainer.register(RequestManager.self) {
            _ in RequestManager()
        }
        defaultContainer.register(Realm.self) {
            _ in try! Realm()
        }
        defaultContainer.register(APIClient.self) {
            _ in APIClient(authorizationManager: defaultContainer.resolve(AuthDataManager.self)!, requestManager: defaultContainer.resolve(RequestManager.self)!, realm: defaultContainer.resolve(Realm.self)!)
        }
//        defaultContainer.register(CredentialsManager.self) {
//            _ in CredentialsManager()
//        }
//        defaultContainer.register(PasscodeManager.self) {
//            _ in PasscodeManager()
//        }
        defaultContainer.register(BiometricsManager.self) {
            _ in BiometricsManager()
        }
        

        
        // A MVP setup
        defaultContainer.register(APresenterDelegate.self) { _ in
            APresenter(APIClient: defaultContainer.resolve(APIClient.self)!)
        }

        defaultContainer.storyboardInitCompleted(AutomobileVC.self) { resolver, controller in
            var presenter = resolver.resolve(APresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
        
        // A MVP setup
        defaultContainer.register(BPresenterDelegate.self) { _ in
            BPresenter(APIClient: defaultContainer.resolve(APIClient.self)!, realm: defaultContainer.resolve(Realm.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(BVC.self) { resolver, controller in
            var presenter = resolver.resolve(BPresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
        
        //StartNavigationMVP setup
        defaultContainer.register(StartNavigationPresenterDelegate.self) { _ in
            StartNavigationPresenter(defaults: defaultContainer.resolve(UserDefaults.self)!, authorizationManager: defaultContainer.resolve(AuthDataManager.self)!, APIClient: defaultContainer.resolve(APIClient.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(StartNavigationViewController.self) { resolver, controller in
            var presenter = resolver.resolve(StartNavigationPresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
        
        //Authorization MVP setup
        defaultContainer.register(AuthorizationPresenterDelegate.self) { _ in
            AuthroizationPresenter(defaults: defaultContainer.resolve(UserDefaults.self)!, authorizationManager: defaultContainer.resolve(AuthDataManager.self)!, APIClient: defaultContainer.resolve(APIClient.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(AuthorizationViewController.self) { resolver, controller in
            var presenter = resolver.resolve(AuthorizationPresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
        
        //Fines List MVP setup
        defaultContainer.register(FinesListPresenterDelegate.self) { _ in
            FinesListPresenter(defaults: defaultContainer.resolve(UserDefaults.self)!, authorizationManager: defaultContainer.resolve(AuthDataManager.self)!, APIClient: defaultContainer.resolve(APIClient.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(FinesListViewController.self) { resolver, controller in
            var presenter = resolver.resolve(FinesListPresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
        
        //Main MVP setup
        defaultContainer.register(MainPresenterDelegate.self) { _ in
            MainPresenter(defaults: defaultContainer.resolve(UserDefaults.self)!, authorizationManager: defaultContainer.resolve(AuthDataManager.self)!, APIClient: defaultContainer.resolve(APIClient.self)!, realm: defaultContainer.resolve(Realm.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(MainViewController.self) { resolver, controller in
            var presenter = resolver.resolve(MainPresenterDelegate.self)
            presenter?.view = controller
            controller.presenter = presenter
        }
    }
}
