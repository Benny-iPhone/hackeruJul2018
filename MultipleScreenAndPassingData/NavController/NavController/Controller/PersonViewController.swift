//
//  PersonViewController.swift
//  NavController
//
//  Created by hackeru on 16/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

protocol PersonViewControllerDelegate : NSObjectProtocol {
    func personViewController(_ controller : PersonViewController,
                              didUpdatePerson person : Person)
}

class PersonViewController: UIViewController {

    weak var delegate : PersonViewControllerDelegate?
    
    var person : Person!
    var indexPath : IndexPath!
    
    @IBOutlet weak var textField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = person.name
        textField.becomeFirstResponder()
    }

    @IBAction func textFieldEditingChangedAction(_ sender: UITextField) {
        //let name = sender.text != nil ? sender.text! : ""
        let name = sender.text ?? ""
        person.name = name
        
        //notify delegate
        delegate?.personViewController(self, didUpdatePerson: self.person)
        
        
        //let obj = editingObject ?? Object.createNewInDatabase()
        
    }
    

}








