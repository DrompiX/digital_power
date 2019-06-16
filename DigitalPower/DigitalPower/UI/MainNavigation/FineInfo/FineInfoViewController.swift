//
//  FineInfoViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class FineInfoViewController: UIViewController, FineInfoViewDelegate {
    func reloadData() {
        
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var fineNumber: UILabel!
    @IBOutlet weak var expiryDate: UILabel!
    
    override func viewDidLoad() {
        presenter.onLoad()
    }
    
    func loadData(fine: Fine) {
        var result = ""
        for line in fine.title {
            result += line.text
        }
        titleLabel.text = result
        dateLabel.text = "Дата: " + fine.date
        if Int(fine.status) == 1 {
            statusLabel.text = "Статус: НЕ ОПЛАЧЕНО"
        } else {
            statusLabel.text = "Статус: ОПЛАЧЕНО"
        }
        fineNumber.text = "Номер постановления: " + fine.fine_id
        expiryDate.text = "Срок оплаты: " + fine.expiry_date
    }
    
    var presenter: FineInfoPresenterDelegate! 
    @IBAction func backButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FinesViewController") as! FinesListViewController
        controller.presenter.setId(id: presenter.getId())
        self.present(controller, animated: true)
    }
}
