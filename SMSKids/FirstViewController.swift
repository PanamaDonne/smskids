//
//  FirstViewController.swift
//  SMSKids
//
//  Created by Daniel - Home on 28/04/15.
//  Copyright (c) 2015 smskids. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices
import AVFoundation
import Parse


class FirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    var captureDevice : AVCaptureDevice?
    
    @IBOutlet weak var captureLabel: UILabel!
    
    
    override func viewDidAppear(animated: Bool) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            
            
            println("captureVideoPressed and camera available.")
            
            var imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = .Camera;
            imagePicker.mediaTypes = [kUTTypeMovie!]
            imagePicker.allowsEditing = false
            
            imagePicker.showsCameraControls = true
            
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }
            
        else {
            println("Camera not available.")
        }
        
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        captureLabel.font = UIFont.fontAwesomeOfSize(160)
        captureLabel.text = String.fontAwesomeIconWithName(FontAwesome.VideoCamera)
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(20)] as Dictionary!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let tempImage = info[UIImagePickerControllerMediaURL] as! NSURL!
        let pathString = tempImage.relativePath
        self.dismissViewControllerAnimated(true, completion: {})
        
        UISaveVideoAtPathToSavedPhotosAlbum(pathString, self, nil, nil)
    
    }
    
}