//
//  CustomControl.swift
//  CustomControl
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var label : UILabel?{
        get{
            return subviews.flatMap { $0 as? UILabel}.first
        }
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        highlight(true)
        return super.beginTracking(touch, with: event)
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        highlight(false)
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        highlight(false)
        super.cancelTracking(with: event)
    }
    
    private func highlight(_ h : Bool){
        
        for sub in self.subviews{
            sub.alpha = h ? 0.7 : 1
        }
        
        //self.subviews.forEach { $0.alpha = h ? 0.7 : 1 }
        
    }

}
















