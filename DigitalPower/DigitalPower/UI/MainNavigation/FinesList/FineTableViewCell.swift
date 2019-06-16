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
    
    
    func setTitleLabel(titleText: [Titles]) {
        var result = ""
        for line in titleText {
            result += line.text
        }
        titleLabel.text = result
    }
    
    func setDescription(text: String) {
        descriptionLabel.text = text 
    }
}
