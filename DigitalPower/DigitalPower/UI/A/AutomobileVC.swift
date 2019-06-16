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
    
    var presenter: APresenterDelegate!
    
    @IBAction func onSendButton(_ sender: Any) {
//
//        var parameters = ["region" : "77", "auto_number": "Р081РН", "registration_full" : "7710406576", "name": "" ]
//        presenter.setCar(parameters: parameters)
        
        if let region = region.text, let sign = signLabel.text, let document = documentLabel.text {
            var parameters = ["region" : region, "auto_number": sign, "registration_full" : document]
            presenter.setCar(parameters: parameters)
        } else {
            
        }
    }
    
    func presentList() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainView")
        self.present(controller, animated: true, completion: nil)
    }
}

extension AutomobileVC: AViewDelegate {
    
}
