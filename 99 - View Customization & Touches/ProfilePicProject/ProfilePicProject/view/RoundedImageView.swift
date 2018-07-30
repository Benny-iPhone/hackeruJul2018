//
//  RoundedImageView.swift
//  ProfilePicProject
//
//  Created by Benny Davidovitz on 30/07/2018.
//  Copyright © 2018 hackeru. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    func makeItRound(){
        
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
        layer.masksToBounds = true
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        makeItRound()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        makeItRound()
    }
    
}










