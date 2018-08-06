//
//  ViewController.swift
//  MediaPicker
//
//  Created by Benny Davidovitz on 06/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //by default imageview doesn't suuport user interaction (like gestures)
        imageView.isUserInteractionEnabled = true
    }
    
    @IBAction func imageTappedAction(_ sender: Any) {
        //print("image tapped")
        
        let actionSheet = UIAlertController(title: "Select Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)
        
        
        func handler(_ action : UIAlertAction){
            let text = action.title ?? ""
            
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            
            switch text {
            case "Album":
                picker.sourceType = .photoLibrary
            case "Rear Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .rear
            case "Selfie Camera":
                picker.sourceType = .camera
                picker.cameraDevice = .front
            default:
                return
            }
            
            picker.delegate = self
            
            self.present(picker, animated: true, completion: nil)
            
        }
        
        let albumAction = UIAlertAction(title: "Album", style: .destructive, handler: handler)
        actionSheet.addAction(albumAction)
        
        if UIImagePickerController.isCameraDeviceAvailable(.rear){
            actionSheet.addAction(UIAlertAction(title: "Rear Camera", style: .default, handler: handler))
        }
        
        if UIImagePickerController.isCameraDeviceAvailable(.front){
            actionSheet.addAction(UIAlertAction(title: "Selfie Camera", style: .default, handler: handler))
        }
        
        //display the action sheet
        self.present(actionSheet, animated: true, completion: nil)
        
        
    }
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = (info[UIImagePickerControllerEditedImage] ?? info[UIImagePickerControllerOriginalImage]) as? UIImage
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
        
    }
}

























