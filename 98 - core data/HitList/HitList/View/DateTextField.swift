//
//  DateTextField.swift
//  HitList
//
//  Created by hackeru on 26/07/2018.
//  Copyright © 2018 hungry.hackeru. All rights reserved.
//

import UIKit

class DateTextField: UITextField {

    var selectedDate : Date{
        get{
            let datePicker = self.inputView as! UIDatePicker
            return datePicker.date
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.backgroundColor = .white
        
        //progomatically hook IBAction
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        
        //override keyboard view
        self.inputView = datePicker
    }
    
    @objc func datePickerAction(_ sender : UIDatePicker)
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.text = formatter.string(from: sender.date)
    }
}
















