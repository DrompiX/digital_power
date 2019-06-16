//
//  SuccessVC.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation

import UIKit
class SuccessVC: UIViewController {
    
    @IBAction func openNext(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "mainView")
        self.present(controller, animated: true, completion: nil)
    }
}
