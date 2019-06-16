//
//  FeeTableView.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class FeeCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    func setTitleLabel(text: String) {
        self.titleLabel.text = text
    }
    
    func setInfoLabel(text: String) {
        self.infoLabel.text = text
    }
}
