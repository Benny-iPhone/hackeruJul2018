//
//  BorderedView.swift
//  CustomView
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

@IBDesignable class BorderedView: UIView {
    
    @IBInspectable var borderColor : UIColor?{
        set{
            layer.borderColor = newValue?.cgColor
        }
        get{
            if let cgColor = layer.borderColor{
                return UIColor(cgColor: cgColor)
            } else {
                return nil
            }
        }
        
    }
    
    // @IBInspectable => can be inspected (a.k.a. 'Edited') in storyboard
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth : CGFloat{
        get{
            return layer.borderWidth
        }
        set{
//            guard Thread.isMainThread else{
//                DispatchQueue.main.async { self.borderWidth = newValue }
//                return
//            }
            layer.borderWidth = newValue
        }
    }

    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    //from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    private func setup(){
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }

    //storyboard preview invoke this method
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}



















