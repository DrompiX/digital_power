//
//  File.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class DriverCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var upperLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setUpperLabel(text: String) {
        self.upperLabel.text = text
        upperLabel.isHidden = false
        imageView.isHidden = true
    }
    
    func setBottomLabel(text: String) {
        self.bottomLabel.text = text
        bottomLabel.isHidden = false
        imageView.isHidden = true
    }
    
    func setAsPlus() {
        imageView.isHidden = false
        upperLabel.isHidden = true
        bottomLabel.isHidden = true
    }
}
