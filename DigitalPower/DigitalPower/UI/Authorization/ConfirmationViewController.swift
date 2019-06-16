//
//  AuthorizationViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class ConfirmationViewController: UIViewController {
    
    @IBAction func onConfirmClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainView")
        self.present(controller, animated: true, completion: nil)
    }
}
