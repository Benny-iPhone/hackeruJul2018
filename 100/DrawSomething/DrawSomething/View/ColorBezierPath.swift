//
//  ColorBezierPath.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class ColorBezierPath: UIBezierPath {
    
    var color : UIColor = .black
    
    override func stroke() {
        color.setStroke()
        
        super.stroke()
    }

}










