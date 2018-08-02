//
//  CheckBoxImageView.swift
//  CheckBox
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class CheckBoxImageView: UIImageView {

    typealias Callback = (_ isChecked : Bool) -> Void
    var callback : Callback?
    
    var isChecked : Bool{
        get{
            return self.isHighlighted
        }
        set{
            self.isHighlighted = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.image = #imageLiteral(resourceName: "icons8-unchecked_checkbox")
        self.highlightedImage = #imageLiteral(resourceName: "icons8-checked_checkbox")
        
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func tapAction(){
        self.isChecked = !self.isChecked
        //notify
        self.callback?(self.isChecked)
    }

}












