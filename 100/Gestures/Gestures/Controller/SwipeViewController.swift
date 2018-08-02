//
//  SwipeViewController.swift
//  Gestures
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeAction = UISwipeGestureRecognizer(target: self, action: #selector(swipeBackAction))
        
        swipeAction.direction = .right
        
        self.view.addGestureRecognizer(swipeAction)

    }
    
    @objc func swipeBackAction(){
        self.navigationController?.popViewController(animated: true)
    }

    

}













