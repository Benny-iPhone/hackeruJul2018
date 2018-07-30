//
//  ViewController.swift
//  InteractiveLabel
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit
import FRHyperLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var termsOfUseLabel: FRHyperLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
    }
    
    private func setupLabel(){
        
        //setup
        termsOfUseLabel.setLinkForSubstring("terms of use") { (_, _) in
            
            let termsVC = self.storyboard!.instantiateViewController(withIdentifier: "terms")
            self.navigationController?.pushViewController(termsVC, animated: true)
        }
    }



}






