
//
//  AuthroizationViewComtroller.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class AuthorizationViewController: UIViewController {
    var presenter: AuthorizationPresenterDelegate!
    
    @IBAction func onEnterButtonTap(_ sender: Any) {
        presenter.authorize()
    }
}


extension AuthorizationViewController: AuthorizationViewDelegate {
    
}
