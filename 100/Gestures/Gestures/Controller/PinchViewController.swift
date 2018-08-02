//
//  PinchViewController.swift
//  Gestures
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class PinchViewController: UIViewController {

    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
        guard let targetView = sender.view else{
            return
        }
        
        let transform = targetView.transform.scaledBy(x: sender.scale, y: sender.scale)
        
        targetView.transform = transform
        //restore scale factor to default in order to identify the correct delta in next action
        sender.scale = 1
        
    }
    
}









