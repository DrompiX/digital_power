//
//  SetFaceViewController.swift
//  DigitalPower
//
//  Created by Розалия Амирова on 16/06/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Alamofire

class SetFaceViewController: UIViewController, SetFaceViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var presenter: SetFacePresenterDelegate!
    
    
    var input: AVCaptureDeviceInput?
    
    func openNextScreen() {
        let storyboard = UIStoryboard(name: "Authorization", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "success")
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func openCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .camera
            myPickerController.cameraDevice = .front
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
    
    func getDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
        let devices: NSArray = AVCaptureDevice.devices() as NSArray;
        for de in devices {
            let deviceConverted = de as! AVCaptureDevice
            if(deviceConverted.position == position){
                return deviceConverted
            }
        }
        return nil
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        
        let imgData = selectedImage.jpegData(compressionQuality: 1)!
//
        let parameters = ["Content-Type": "multipart/form-data"] //Optional for extra parameter
        
        let urlRequest = URL.init(string: "http//10.116.118.67:5000/api/user")
        
//
//        Alamofire.upload(imgData, to: "10.116.118.67:5000/api/user", method: .get, headers: parameters).response {
//            response in
//            print(response)
//        }
//
//
//        Alamofire.request(urlRequest!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
//            response in
//            print(response)
//        }
//
        
        self.dismiss(animated: false)
        openNextScreen()
    }
}
