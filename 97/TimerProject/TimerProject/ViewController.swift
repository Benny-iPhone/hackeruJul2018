//
//  ViewController.swift
//  TimerProject
//
//  Created by Benny Davidovitz on 23/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    var timer : Timer?
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        let angle = CGFloat.pi * 0.01

        let p = sender.location(in: self.view)
        UIView.animate(withDuration: 0.3, animations: {
            self.blueView.center = p
        }) { (_) in
            //animatation completed
            if self.timer != nil{
                self.timer?.invalidate() //stop timer
                self.timer = nil //release timer
                return
            }
            
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { (_) in
                self.blueView.transform = self.blueView.transform.rotated(by: angle)
            })
            
        }
        
    }
    
}










