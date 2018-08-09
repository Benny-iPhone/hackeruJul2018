//
//  LoginViewController.swift
//  Animations
//
//  Created by Benny Davidovitz on 09/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailCenterXLayout: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    
    var textFields : [UITextField]{
        get{
            return self.containerView.subviews.flatMap{ $0 as? UITextField }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        emailCenterXLayout.constant -= self.view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        newAnimationCode()
    }
    
    private func newAnimationCode(){
        
        //let screenWidth = self.view.bounds.width

        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.7, options: .curveLinear, animations: {
            self.emailCenterXLayout.constant = 0
            self.view.layoutIfNeeded()

        }, completion: nil)
        
//        UIView.animate(withDuration: 0.7, animations: {
//            self.emailCenterXLayout.constant = 0
//            self.view.layoutIfNeeded()
//        })
    }
    
    private func oldAnimationCode(){
        let textFields = self.textFields
        let screenWidth = self.view.bounds.width
        
        for obj in textFields{
            obj.center.x -= screenWidth
            obj.isHidden = false
        }
        
        UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseInOut, animations: {
            for obj in textFields{
                obj.center.x += screenWidth
            }
            
        }) { (_) in
            //open keyboard
            textFields.first?.becomeFirstResponder()
        }
        
        //        UIView.animate(withDuration: 0.3) {
        //            for obj in textFields{
        //                obj.center.x += screenWidth
        //            }
        //        }
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
    }
    
    private func setupGradient(){
        if containerView.layer.sublayers?.first is CAGradientLayer{
            //old layer exist
            containerView.layer.sublayers?.remove(at: 0)
        }
        
        let gradient = CAGradientLayer()
        gradient.frame = containerView.bounds
        
        gradient.colors = [UIColor.red.withAlphaComponent(0.6).cgColor,UIColor.white.cgColor]
        containerView.layer.insertSublayer(gradient, at: 0)
    }

    @IBAction func tapAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}














