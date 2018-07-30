//
//  CustomFontLabel.swift
//  CustomLabel
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class CustomFontLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup(){
        self.font = UIFont(name: "HanaleiFill-Regular", size: 24)
    }
}











