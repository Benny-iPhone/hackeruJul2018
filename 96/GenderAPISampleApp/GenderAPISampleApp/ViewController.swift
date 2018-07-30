//
//  ViewController.swift
//  GenderAPISampleApp
//
//  Created by Benny Davidovitz on 19/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func guessGenderAction(_ sender: UIButton)
    {
        
        guard let name = textField.text, name.isEmpty == false else{
            return
        }
        
        APIManager.manager.findGender(of: name) { (gender, error) in
            guard let gender = gender else{
                print(error?.localizedDescription ?? "unknown error")
                return
            }
            
            sender.setTitle(gender.rawValue, for: .normal)
        }
        
    }
    


}









