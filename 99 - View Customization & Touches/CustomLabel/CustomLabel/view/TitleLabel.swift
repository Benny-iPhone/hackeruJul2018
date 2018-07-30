//
//  TitleLabel.swift
//  CustomLabel
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        
        self.font = UIFont.boldSystemFont(ofSize: 24)
        self.textColor = .red
        self.textAlignment = NSTextAlignment.center
        
        self.shadowColor = .darkGray
        self.shadowOffset = CGSize(width: 1, height: 1) //1 px right, 1 px down
        
        //self.numberOfLines = 0 //inifinite
        
        self.numberOfLines = 3
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.50 //50% of original font size
        
    }

}















