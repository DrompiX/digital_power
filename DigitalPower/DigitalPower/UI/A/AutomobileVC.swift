//
//  AutomobileVC.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit


class AutomobileVC: UIViewController {
    
    @IBOutlet weak var region: UITextField!
    @IBOutlet weak var signLabel: UITextField!
    @IBOutlet weak var documentLabel: UITextField!
    @IBOutlet weak var autoName: UITextField!
    
    var presenter: APresenterDelegate!
    
    @IBAction func onSendButton(_ sender: Any) {
        if let region = region.text, let sign = signLabel.text, let document = documentLabel.text, let name = autoName.text {
            var parameters = ["region" : "77", "auto_number": "Р081РН", "registration_full" : "7710406576", "name": name ]
            presenter.setCar(parameters: parameters)
        }
    }
}

extension AutomobileVC: AViewDelegate {
    
}
