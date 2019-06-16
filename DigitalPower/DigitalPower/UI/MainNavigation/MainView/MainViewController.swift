//
//  MainViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MainViewDelegate {
    @IBOutlet weak var carsCollectionView: UICollectionView!
    @IBOutlet weak var driversCollectionView: UICollectionView!
    
    var presenter: MainPresenterDelegate!
    
    override func viewDidLoad() {
        presenter.onLoad()
        self.carsCollectionView.delegate = self
        self.carsCollectionView.dataSource = self
//
        self.driversCollectionView.delegate = self
        self.driversCollectionView.dataSource = self
        
        registerCell()
    }
    
    func registerCell() {
        carsCollectionView.register(UINib.init(nibName: "CarCellPrototype", bundle: nil), forCellWithReuseIdentifier: "CarCellPrototype")
        driversCollectionView.register(UINib.init(nibName: "DriverCellPrototype", bundle: nil), forCellWithReuseIdentifier: "DriverCellPrototype")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carsCollectionView {
            return presenter.getNumberOfCars()
        } else {
            return presenter.getNumberOfDrivers()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carsCollectionView {
            let cell = carsCollectionView.dequeueReusableCell(withReuseIdentifier: "CarCellPrototype", for: indexPath) as! CarCollectionViewCell
            return presenter.onBindCarCell(cell: cell, indexPath: indexPath)
        } else {
            let cell = driversCollectionView.dequeueReusableCell(withReuseIdentifier: "DriverCellPrototype", for: indexPath) as! DriverCollectionViewCell
            return presenter.onBindDriverCell(cell: cell, indexPath: indexPath)
        }
    }
    
    func reloadData() {
        carsCollectionView.reloadData()
    }
}
