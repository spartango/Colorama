//
//  CaptureViewController.swift
//  Matching
//
//  Created by Anand Gupta on 4/2/15.
//  Copyright (c) 2015 Anand Gupta. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class CaptureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        capture()
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        println("i've got an image")
    }
    
    func capture() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            println("Button capture")
            
            var cameraController = UIImagePickerController()
            cameraController.delegate = self
            cameraController.sourceType = UIImagePickerControllerSourceType.Camera;
            cameraController.mediaTypes = [kUTTypeImage]
            cameraController.allowsEditing = false
            
            self.presentViewController(cameraController, animated: true, completion: nil)
        } else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            println("Library chooser")
            
            var pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            pickerController.mediaTypes = [kUTTypeImage]
            pickerController.allowsEditing = false
            self.presentViewController(pickerController, animated: true, completion: nil)
        } else {
            println("Nothing to pick from")
        }
    }
}