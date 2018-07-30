//
//  UserInfoViewController.swift
//  ChildViewControllers
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    static var random : UIColor{
        get{
            let redVal = CGFloat(arc4random_uniform(256)) / 255
            let blueVal = CGFloat(arc4random_uniform(256)) / 255
            let greenVal = CGFloat(arc4random_uniform(256)) / 255
            
            return UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1)
        }
    }
}


class UserInfoViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
//            UIView.animate(withDuration: 2, animations: {
//                self.parent?.view.backgroundColor = .random
//            })
//        }
        

        let score = arc4random_uniform(1_000)
        scoreLabel.text = "\(score)"
        
        usernameLabel.text = UIDevice.current.name
        
        view.backgroundColor = UIColor.orange.withAlphaComponent(0.3)
        
        
        
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        
        let settingsVC = SettingsViewController.createVC()
        //settingsVC.something = value
        
        self.present(settingsVC, animated: true, completion: nil)
        
    }
    

}
















