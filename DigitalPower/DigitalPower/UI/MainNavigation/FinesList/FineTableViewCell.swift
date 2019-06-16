//
//  FineTableViewCell.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class FineTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var fineImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    func setTitleLabel(titleText: [Titles]) {
        var result = ""
        for line in titleText {
            result += line.text
        }
        titleLabel.text = result
        
        if result.contains("парковка") {
            fineImage.image = UIImage.init(named: "parking")
        } else {
            fineImage.image = UIImage.init(named: "speed")
        }
    }
    
    func setDescription(text: String) {
        descriptionLabel.text = text + " рублей"
    }
    
    func setDate(text: String) {
        dateLabel.text = text
    }
    
    func setStatus(text: String) {
        if Int(text) == 1 {
            statusLabel.text = "НЕ ОПЛАЧЕН"
            statusLabel.textColor = UIColor.red
        } else {
            statusLabel.text = "ОПЛАЧЕН"
            statusLabel.textColor = UIColor.blue
        }
    }
    
}
