//
//  TargetViewController.swift
//  HitList
//
//  Created by hackeru on 26/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var birthDateTextField: DateTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.becomeFirstResponder()
    }

    @IBAction func saveAction(_ sender: Any) {
        
        //validate input
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else{
            return
        }
        
        guard let lastName = lastNameTextField.text, !lastName.isEmpty else{
            return
        }
        
        //Create in database
        Target.createTargetWith(firstName: firstName,
                                lastName: lastName,
                                birthDate: birthDateTextField.selectedDate)
        
        //pop back to list
        self.navigationController?.popViewController(animated: true)
        
    }
    
}





