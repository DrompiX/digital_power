//
//  OnBoardingViewController.swift
//  Transcrypt
//
//  Created by Denis Zaplatnikov on 25/06/2018.
//  Copyright © 2018 Units. All rights reserved.
//

import UIKit

protocol OnBoardingChangePageDelegate {
    func onPageChanged()
}

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var nextOrFinishButton: UIButton!
    private var onBoardingPageViewController: OnBoardingPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pageViewControllerSegue" {
            onBoardingPageViewController = segue.destination as? OnBoardingPageViewController
            onBoardingPageViewController.onBoardingChangePageDelegate = self
        }
    }

    @IBAction func nextOrFinishButtonClicked(_ sender: Any) {
        if onBoardingPageViewController.isLastPage() {
            let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "authorization")
            self.present(controller, animated: true, completion: nil)
        } else {
            onBoardingPageViewController.navigateToNextPage()
        }
    }

}

extension OnBoardingViewController: OnBoardingChangePageDelegate {
    func onPageChanged() {
        UIView.performWithoutAnimation {
            if onBoardingPageViewController.isLastPage() {
                nextOrFinishButton.setTitle("Готово", for: .normal)
            } else {
                nextOrFinishButton.setTitle("Далее", for: .normal)
            }
            nextOrFinishButton.layoutIfNeeded()
        }
    }
}
