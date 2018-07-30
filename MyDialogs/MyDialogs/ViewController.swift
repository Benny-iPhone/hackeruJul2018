//
//  ViewController.swift
//  MyDialogs
//
//  Created by hackeru on 12/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dialog1: UIView!
    @IBOutlet weak var dialog1Msg: UILabel!
    
    @IBAction func toggleDialog1(_ sender: Any) {
        dialog1.isHidden = !dialog1.isHidden;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func show2(_ sender: Any) {
        let alert = UIAlertController(title: "Dialog 2", message: "hello from dialog2", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil);
        
    }
    
    @IBAction func show3(_ sender:UIButton){
        let alert = UIAlertController(title: "Dialog 3",message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let fields = alert.textFields;
        let field = fields![0];
        
        alert.addAction(UIAlertAction(title: "Bisli-batzal", style: .default, handler: {(a)in
            self.showFirstDialog(field.text!)
            
        }))
        
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func show4(_ sender: UIButton) {
        var uName,uPass:UITextField!;
        
        let alert = UIAlertController(title: "Login", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(tf)in
            uName = tf;
            tf.placeholder = "username"
        })
        alert.addTextField(configurationHandler: {(tf)in
            uPass = tf;
            tf.placeholder = "password"
            tf.isSecureTextEntry = true;
        })
        func identifyUser(action:UIAlertAction)->Void{
            if(uName.text=="bubu"&&uPass.text=="1234"){
                showFirstDialog("welcome\(uName!)")
            }
        }
        
        alert.addAction(UIAlertAction(title: "cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: identifyUser))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func showFirstDialog(_ msg:String){
        dialog1Msg.text = msg;
        dialog1.isHidden = false;
    }
}

