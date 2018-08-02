//
//  Utils.swift
//  Gestures
//
//  Created by Benny Davidovitz on 02/08/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

extension UIColor{
    static var random : UIColor{
        get{
            
            let redValue = CGFloat(arc4random_uniform(256)) / 255
            let greenValue = CGFloat(arc4random_uniform(256)) / 255
            let blueValue = CGFloat(arc4random_uniform(256)) / 255

            return UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        }
    }
}













