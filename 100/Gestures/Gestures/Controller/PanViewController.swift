//
//  PanViewController.swift
//  Gestures
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class PanViewController: UIViewController {

    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        sender.view?.center = sender.location(in: self.view)
        
    }
    

}
