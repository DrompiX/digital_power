//
//  OnBoardingPageContentViewController.swift
//  Transcrypt
//
//  Created by Denis Zaplatnikov on 25/06/2018.
//  Copyright © 2018 Units. All rights reserved.
//

import UIKit

class OnBoardingPageContentViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!

    var titleText: String?
    var content: String?
    var image: UIImage?
    var pageIndex: Int = -1

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
        contentLabel.text = content
        imageView.image = image
    }

}
