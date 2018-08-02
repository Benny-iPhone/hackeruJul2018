//
//  DrawView.swift
//  DrawSomething
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var strokeColor : UIColor = .black
    var strokeWidth : CGFloat = 1
    
    private var beziers : [ColorBezierPath] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //only one touch is enabled
        self.isMultipleTouchEnabled = false
    }
    
    func clear(){
        self.beziers = []
        //re-draw
        setNeedsDisplay()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let point = touches.first?.location(in: self) else{
            return
        }
        
        let b = ColorBezierPath()
        b.color = self.strokeColor
        b.lineWidth = self.strokeWidth
        
        b.move(to: point)
        self.beziers.append(b)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let point = touches.first?.location(in: self) else{
            return
        }
        
        beziers.last?.addLine(to: point)
        //re-draw
        setNeedsDisplay()
    }

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        for b in beziers{
            b.stroke()
        }
    }
    

}













