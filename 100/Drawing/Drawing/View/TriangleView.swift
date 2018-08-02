//
//  MyView.swift
//  Drawing
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

@IBDesignable class TriangleView: UIView {

    @IBInspectable var strokeWidth : CGFloat = 1{
        didSet{
            //re draw
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var strokeColor : UIColor = .black{
        didSet{
            //re-draw
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var fillColor : UIColor = .clear{
        didSet{
            //re-draw
            setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        
        let width = self.bounds.width
        let height = self.bounds.height
        
        context.move(to: CGPoint(x: width * 0.5, y: height * 0.1))
        context.addLine(to: CGPoint(x: width * 0.1, y: height * 0.8))
        context.addLine(to: CGPoint(x: width * 0.9, y: height * 0.8))
        
        context.closePath()
        
        context.setLineWidth(self.strokeWidth)
        self.strokeColor.setStroke()
        //UIColor.red.setStroke()
        //context.setStrokeColor(UIColor.red.cgColor)
        
        //context.strokePath()
        fillColor.setFill()
        
        context.drawPath(using: .fillStroke)
        
    }
    

}





















