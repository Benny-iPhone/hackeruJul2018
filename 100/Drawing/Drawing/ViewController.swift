//
//  ViewController.swift
//  Drawing
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func sliderAction(_ sender: UISlider) {
        
        guard let tView = self.view as? TriangleView else{
            return
        }
        
        tView.strokeWidth = CGFloat(sender.value)
        
    }
    

}













