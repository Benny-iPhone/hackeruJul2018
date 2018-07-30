//
//  ViewController.swift
//  CustomControl
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        myButton.layer.cornerRadius = 8
        myButton.layer.borderWidth = 1
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.masksToBounds = true
    }

    @IBAction func controlPressed(_ sender: CustomControl) {
        
        sender.label?.textColor = .blue
        
        print(#line)
        print(#function)
        
    }
    
}










