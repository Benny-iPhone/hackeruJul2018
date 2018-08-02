//
//  RotateViewController.swift
//  Gestures
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class RotateViewController: UIViewController {

    @IBAction func rotationAction(_ sender: UIRotationGestureRecognizer) {
        
        guard let targetView = sender.view else {return}
        
        let transform = targetView.transform.rotated(by: sender.rotation)
        
        targetView.transform = transform
        
        sender.rotation = 0
        
    }
    

}






