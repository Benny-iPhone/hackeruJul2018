//
//  ViewController.swift
//  AlertProject
//
//  Created by Benny Davidovitz on 09/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func simpleAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "yo dude", message: "vlad is gay", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dah", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func twoButtonsAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "I am hungry", message: "Do you want a toast?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "It's Mashmin", style: .cancel, handler: nil))
        
        let yesAction = UIAlertAction(title: "Cofix!", style: .default, handler: { (_) in
            print("lets go")
        })
        yesAction.setValue(#imageLiteral(resourceName: "icons8-toaster"), forKey: "image")
        
        alert.addAction(yesAction)
        alert.view.tintColor = .orange
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func alertWithInputAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Name", message: nil, preferredStyle: .alert)
        
        let submitAction = UIAlertAction(title: "Submit", style: .destructive) { (_) in
            //read the input text and do something with it
            guard let text = alert.textFields?.first?.text else{
                return
            }
            
            print("adding " + text)
        }
        alert.addAction(submitAction)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Type a name"
            textField.keyboardType = .alphabet
            textField.textColor = .orange
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func loginAlertAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "login", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.keyboardType = .emailAddress
            textField.placeholder = "Type email"
            
            #if DEBUG
                textField.text = "a@a.com"
            #else
            
            #endif
            
        }
        
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "Type password"
            
            #if DEBUG
                textField.text = "P455W0RD"
            #else
            
            #endif

        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        let loginAction = UIAlertAction(title: "Login", style: .default) { (_) in
            
            guard let email = alert.textFields?.first?.text,
                let password = alert.textFields?.last?.text else{
                    return
            }
            
            if email == "a@a.com" && password == "P455W0RD"{
                print("login success")
            } else {
                print("login failed")
            }
            
        }
        
        alert.addAction(loginAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    

}

















