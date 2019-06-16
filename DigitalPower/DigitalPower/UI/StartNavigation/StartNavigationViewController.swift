//
//  StartNavigationViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class StartNavigationViewController: UIViewController {
    var presenter: StartNavigationPresenterDelegate!
    
    override func viewDidLoad() {
//        self.presenter.onLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.presenter.onLoad()
    }
    
}


extension StartNavigationViewController: StartNavigationViewDelegate {
    func openAuthorizationSceen() {
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "authorization")
        self.present(controller, animated: true, completion: nil)
    }
    
    func openOnBoarding() {
        let storyboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "OnBoarding")
        self.present(controller, animated: true, completion: nil)
    }
}
