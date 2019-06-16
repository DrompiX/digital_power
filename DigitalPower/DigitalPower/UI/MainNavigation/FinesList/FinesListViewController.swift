//
//  FineListViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class FinesListViewController: UIViewController {
    var presenter: FinesListPresenterDelegate!
    @IBOutlet weak var tableview: UITableView!
    var informationAlert = UIAlertController()
    
    override func viewDidLoad() {
        tableview.dataSource = self
        tableview.delegate = self
        registerCell()
        presenter.onLoad()
    }
    
    func registerCell() {
        tableview.register(UINib.init(nibName: "FineCell", bundle: nil), forCellReuseIdentifier: "FineCell")
    }
}



extension FinesListViewController: FinesListViewDelegate {
    
}

extension FinesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfFines()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "FineCell") as! FineTableViewCell
        presenter.onBindFeeCell(cell: cell, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func reloadTableView() {
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "fineInfoViewController") as! FineInfoViewController
        controller.presenter.setFine(fine: presenter.getFineForIndexPath(indexPath: indexPath))
        self.present(controller, animated: true)
    }
    
    
    func showAlert(text: String) {
        informationAlert = UIAlertController(title: text, message: "", preferredStyle: UIAlertController.Style.alert)
        informationAlert.popoverPresentationController?.sourceView = self.view
        informationAlert.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection()
        informationAlert.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        DispatchQueue.main.async {
            self.present(self.informationAlert, animated: true)
        }
    }
    
    func hideAlert(completion: @escaping () -> Void) {
        informationAlert.dismiss(animated: false) {
            completion()
        }
    }
}

extension FinesListViewController: UITableViewDelegate {
    
}
