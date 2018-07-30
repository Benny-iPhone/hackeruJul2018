//
//  CustomAlertViewController.swift
//  CustomAlert
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {

    var alertTitle : String?
    var alertMessage : String?
    var alertButton : String?
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var messageLabel : UILabel!
    @IBOutlet weak var actionButton : UIButton!
    
    class func createVC(with title : String? = nil,
                        message : String? = nil,
                        button : String? = nil) -> CustomAlertViewController
    {
        let alertVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "CustomAlertViewController") as! CustomAlertViewController
        
        alertVC.alertTitle = title ?? "Alert"
        alertVC.alertMessage = message ?? ""
        alertVC.alertButton = button ?? "OK"
        
        return alertVC
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        actionButton.setTitle(alertButton, for: .normal)
    }
    
    @IBAction func actionButtonPressed(){
        self.dismiss(animated: true, completion: nil)
    }

   

}












