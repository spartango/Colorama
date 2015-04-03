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

    @IBOutlet var imageView: UIImageView!
    var pickerController: UIImagePickerController!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if(imageView.image == nil) {
            capture()
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        println("Going to review")
        review(image);
    }
    
    @IBAction func capture() {
        pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.mediaTypes = [kUTTypeImage]

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            println("Button capture")
            
            pickerController.sourceType = UIImagePickerControllerSourceType.Camera;
            pickerController.allowsEditing = false
            
            self.presentViewController(pickerController, animated: true, completion: nil)
        } else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            println("Library chooser")
            
            pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            pickerController.allowsEditing = false
            
            self.presentViewController(pickerController, animated: true, completion: nil)
        } else {
            println("Nothing to pick from")
        }
    }
    
    func review(image: UIImage!) {
        println("Showing image")
        self.imageView.image = image
        pickerController.dismissViewControllerAnimated(true, completion: nil)
    }
    
}