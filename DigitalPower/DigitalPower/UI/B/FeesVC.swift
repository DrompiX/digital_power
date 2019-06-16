//
//  FeesVC.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 15/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit
class BVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: BPresenterDelegate!
    
    override func viewDidLoad() {
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
    }
    
    func registerCell() {
        self.tableView.register(UINib.init(nibName: "FeeCell", bundle: nil), forCellReuseIdentifier: "FeeCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FinesViewController") as! FinesListViewController
        controller.presenter.setId(id: presenter.getCarIDForRow(indexPath: indexPath))
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

extension BVC: BViewDelegate {
    
}

extension BVC: UITableViewDelegate {
    
}

extension BVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "FeeCell") as! FeeCell
        presenter.onBindFeeCell(cell: cell, indexPath: indexPath)
        return cell
    }
}


