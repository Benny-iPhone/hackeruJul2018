//
//  ViewController.swift
//  CustomAlert
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func testActino(_ sender: Any) {
        
        let alertVC = CustomAlertViewController.createVC(with: "yo!", message: "Message in\nA bottle\n\n***", button: nil)
        
        self.present(alertVC, animated: true, completion: nil)
        
    }
    


}

