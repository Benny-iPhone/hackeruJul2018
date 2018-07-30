//
//  MainViewController.swift
//  ChildViewControllers
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var childTabBarVC : UITabBarController?{
        get{
            
            return childViewControllers.flatMap{ $0 as? UITabBarController}.first
            //return childViewControllers.first{ $0 is UITabBarController} as? UITabBarController
            
        }
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        childTabBarVC?.selectedIndex = sender.tag
    }
    
    
    

}
